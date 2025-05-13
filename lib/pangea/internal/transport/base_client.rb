# frozen_string_literal: true

module Pangea
  module Internal
    module Transport
      # @api private
      #
      # @abstract
      class BaseClient
        PLATFORM_HEADERS =
          {
            "user-agent" => "pangea-ruby/#{Pangea::VERSION}"
          }

        class << self
          # @api private
          #
          # @return [Hash{String=>String}]
          private def auth_headers = {}

          # @api private
          #
          # @param status [Integer, Pangea::Errors::APIConnectionError]
          # @param stream [Enumerable<String>, nil]
          def reap_connection!(status, stream:)
            case status
            in (..199) | (300..499)
              stream&.each { next }
            in Pangea::Errors::APIConnectionError | (500..)
              Pangea::Internal::Util.close_fused!(stream)
            else
            end
          end

          # @api private
          #
          # @param req [Hash{Symbol=>Object}]
          #
          # @raise [ArgumentError]
          def validate!(req)
            keys = [:method, :path, :query, :headers, :body, :unwrap, :page, :structure, :model, :options]
            case req
            in Hash
              req.each_key do |k|
                unless keys.include?(k)
                  raise ArgumentError.new("Request `req` keys must be one of #{keys}, got #{k.inspect}")
                end
              end
            else
              raise ArgumentError.new("Request `req` must be a Hash or RequestOptions, got #{req.inspect}")
            end
          end
        end

        # @api private
        # @return [Pangea::Internal::Transport::PooledNetRequester]
        attr_accessor :requester

        # @api private
        #
        # @param base_url [String]
        # @param headers [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}]
        # @param initial_retry_delay [Float]
        # @param max_retries [Integer]
        # @param timeout [Float]
        def initialize(
          base_url:,
          headers: {},
          initial_retry_delay: 0.0,
          max_retries: 0,
          timeout: 0.0
        )
          @requester = Pangea::Internal::Transport::PooledNetRequester.new

          @base_url = Pangea::Internal::Util.parse_uri(base_url)
          @headers = Pangea::Internal::Util.normalized_headers(
            self.class::PLATFORM_HEADERS,
            {
              "accept" => "application/json",
              "content-type" => "application/json"
            },
            headers
          )
          @initial_retry_delay = initial_retry_delay
          @max_retries = max_retries
          @timeout = timeout
        end

        # @api private
        #
        # @return [Hash{String=>String}]
        private def auth_headers = {}

        # @api private
        #
        # @param req [Hash{Symbol=>Object}] .
        #
        #   @option req [Symbol] :method
        #
        #   @option req [String, Array<String>] :path
        #
        #   @option req [Hash{String=>Array<String>, String, nil}, nil] :query
        #
        #   @option req [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}, nil] :headers
        #
        #   @option req [Object, nil] :body
        #
        #   @option req [Symbol, nil] :unwrap
        #
        #   @option req [Class, nil] :page
        #
        #   @option req [Class, nil] :stream
        #
        #   @option req [Pangea::Internal::Type::Converter, Class, nil] :model
        #
        # @param opts [Hash{Symbol=>Object}] .
        #
        #   @option opts [String, nil] :idempotency_key
        #
        #   @option opts [Hash{String=>Array<String>, String, nil}, nil] :extra_query
        #
        #   @option opts [Hash{String=>String, nil}, nil] :extra_headers
        #
        #   @option opts [Object, nil] :extra_body
        #
        #   @option opts [Integer, nil] :max_retries
        #
        #   @option opts [Float, nil] :timeout
        #
        # @return [Hash{Symbol=>Object}]
        private def build_request(req, opts)
          method, uninterpolated_path = req.fetch_values(:method, :path)

          path = Pangea::Internal::Util.interpolate_path(uninterpolated_path)

          query = Pangea::Internal::Util.deep_merge(req[:query].to_h, opts[:extra_query].to_h)

          headers = Pangea::Internal::Util.normalized_headers(
            @headers,
            auth_headers,
            req[:headers].to_h,
            opts[:extra_headers].to_h
          )

          if @idempotency_header &&
             !headers.key?(@idempotency_header) &&
             (!Net::HTTP::IDEMPOTENT_METHODS_.include?(method.to_s.upcase) || opts.key?(:idempotency_key))
            headers[@idempotency_header] = opts.fetch(:idempotency_key) { generate_idempotency_key }
          end

          timeout = opts.fetch(:timeout, @timeout).to_f.clamp(0..)

          headers.reject! { |_, v| v.to_s.empty? }

          body =
            case method
            in :get | :head | :options | :trace
              nil
            else
              Pangea::Internal::Util.deep_merge(*[req[:body], opts[:extra_body]].compact)
            end

          headers, encoded = Pangea::Internal::Util.encode_content(headers, body)
          {
            method: method,
            url: Pangea::Internal::Util.join_parsed_uri(@base_url, {**req, path: path, query: query}),
            headers: headers,
            body: encoded,
            max_retries: opts.fetch(:max_retries, @max_retries),
            timeout: timeout
          }
        end

        # @api private
        #
        # @param headers [Hash{String=>String}]
        # @param retry_count [Integer]
        #
        # @return [Float]
        private def retry_delay(headers, retry_count:)
          span = Float(headers["retry-after-ms"], exception: false)&.then { _1 / 1000 }
          return span if span

          retry_header = headers["retry-after"]
          return span if (span = Float(retry_header, exception: false))

          span = retry_header&.then do
            Time.httpdate(_1) - Time.now
          rescue ArgumentError
            nil
          end
          return span if span

          scale = retry_count**2
          jitter = 1 - (0.25 * rand)
          (@initial_retry_delay * scale * jitter).clamp(0, @max_retry_delay)
        end

        # @api private
        #
        # @param request [Hash{Symbol=>Object}] .
        #
        #   @option request [Symbol] :method
        #
        #   @option request [URI::Generic] :url
        #
        #   @option request [Hash{String=>String}] :headers
        #
        #   @option request [Object] :body
        #
        #   @option request [Integer] :max_retries
        #
        #   @option request [Float] :timeout
        #
        # @param redirect_count [Integer]
        #
        # @param retry_count [Integer]
        #
        # @param send_retry_header [Boolean]
        #
        # @raise [Pangea::Errors::APIError]
        # @return [Array(Integer, Net::HTTPResponse, Enumerable<String>)]
        private def send_request(request, redirect_count:, retry_count:, send_retry_header:)
          url, _headers, max_retries, timeout = request.fetch_values(:url, :headers, :max_retries, :timeout)
          input = {**request.except(:timeout), deadline: Pangea::Internal::Util.monotonic_secs + timeout}

          begin
            status, response, stream = @requester.execute(input)
          rescue Pangea::Errors::APIConnectionError => e
            status = e
          end

          case status
          in ..299
            [status, response, stream]
          in 300..399 if redirect_count >= self.class::MAX_REDIRECTS
            self.class.reap_connection!(status, stream: stream)

            message = "Failed to complete the request within #{self.class::MAX_REDIRECTS} redirects."
            raise Pangea::Errors::APIConnectionError.new(url: url, response: response, message: message)
          in 300..399
            self.class.reap_connection!(status, stream: stream)

            request = self.class.follow_redirect(request, status: status, response_headers: response)
            send_request(
              request,
              redirect_count: redirect_count + 1,
              retry_count: retry_count,
              send_retry_header: send_retry_header
            )
          in Pangea::Errors::APIConnectionError if retry_count >= max_retries
            raise status
          in (400..) if retry_count >= max_retries || !self.class.should_retry?(status, headers: response)
            decoded = Kernel.then do
              Pangea::Internal::Util.decode_content(response, stream: stream, suppress_error: true)
            ensure
              self.class.reap_connection!(status, stream: stream)
            end

            raise Pangea::Errors::APIStatusError.for(
              url: url,
              status: status,
              body: decoded,
              request: nil,
              response: response
            )
          in (400..) | Pangea::Errors::APIConnectionError
            self.class.reap_connection!(status, stream: stream)

            delay = retry_delay(response || {}, retry_count: retry_count)
            sleep(delay)

            send_request(
              request,
              redirect_count: redirect_count,
              retry_count: retry_count + 1,
              send_retry_header: send_retry_header
            )
          end
        end

        # Execute the request specified by `req`. This is the method that all resource
        # methods call into.
        #
        # @overload request(method, path, query: {}, headers: {}, body: nil, unwrap: nil, page: nil, stream: nil, model: Pangea::Internal::Type::Unknown, options: {})
        #
        # @param method [Symbol]
        #
        # @param path [String, Array<String>]
        #
        # @param query [Hash{String=>Array<String>, String, nil}, nil]
        #
        # @param headers [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}, nil]
        #
        # @param body [Object, nil]
        #
        # @param unwrap [Symbol, nil]
        #
        # @param page [Class, nil]
        #
        # @param model [Pangea::Internal::Type::Converter, Class, nil]
        #
        # @param options [Pangea::RequestOptions, Hash{Symbol=>Object}, nil] .
        #
        #   @option options [Hash{String=>Array<String>, String, nil}, nil] :extra_query
        #
        #   @option options [Hash{String=>String, nil}, nil] :extra_headers
        #
        #   @option options [Object, nil] :extra_body
        #
        #   @option options [Integer, nil] :max_retries
        #
        #   @option options [Float, nil] :timeout
        #
        # @raise [Pangea::Errors::APIError]
        # @return [Object]
        def request(req)
          self.class.validate!(req)
          model = req.fetch(:model) { Pangea::Internal::Type::Unknown }
          opts = req[:options].to_h
          Pangea::RequestOptions.validate!(opts)
          request = build_request(req.except(:options), opts)
          _url = request.fetch(:url)

          _status, response, stream = send_request(
            request,
            redirect_count: 0,
            retry_count: 0,
            send_retry_header: false
          )

          decoded = Pangea::Internal::Util.decode_content(response, stream: stream)
          case req
          in {structure: Class => pr}
            pr.new(response_data: decoded, model: model)
          in {page: Class => page}
            page.new(client: self, req: req, headers: response, page_data: decoded)
          else
            unwrapped = Pangea::Internal::Util.dig(decoded, req[:unwrap])
            Pangea::Internal::Type::Converter.coerce(model, unwrapped)
          end
        end
      end
    end
  end
end

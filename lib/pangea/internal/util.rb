# frozen_string_literal: true

module Pangea
  module Internal
    # @api private
    module Util
      # @api private
      #
      # @return [Float]
      def self.monotonic_secs = Process.clock_gettime(Process::CLOCK_MONOTONIC)

      class << self
        # @api private
        #
        # @param enum [Enumerable<Object>, nil]
        def close_fused!(enum)
          return unless enum.is_a?(Enumerator)

          # rubocop:disable Lint/UnreachableLoop
          enum.rewind.each { break }
          # rubocop:enable Lint/UnreachableLoop
        end

        # @api private
        #
        # @param input [Object]
        #
        # @return [Hash{Object=>Object}, Object]
        def coerce_hash(input)
          case input
          in NilClass | Array | Set | Enumerator | StringIO | IO
            input
          else
            input.respond_to?(:to_h) ? input.to_h : input
          end
        end

        # @api private
        #
        # Assumes each chunk in stream has `Encoding::BINARY`.
        #
        # @param headers [Hash{String=>String}, Net::HTTPHeader]
        # @param stream [Enumerable<String>]
        # @param suppress_error [Boolean]
        #
        # @raise [JSON::ParserError]
        # @return [Object]
        def decode_content(headers, stream:, suppress_error: false)
          case (content_type = headers["content-type"])
          in %r{^application/(?:vnd\.api\+)?json}
            json = stream.to_a.join
            begin
              JSON.parse(json, symbolize_names: true)
            rescue JSON::ParserError => e
              raise e unless suppress_error
              json
            end
          in %r{^application/(?:x-)?jsonl}
            lines = decode_lines(stream)
            chain_fused(lines) do |y|
              lines.each { y << JSON.parse(_1, symbolize_names: true) }
            end
          in %r{^text/event-stream}
            lines = decode_lines(stream)
            decode_sse(lines)
          else
            text = stream.to_a.join
            force_charset!(content_type, text: text)
            StringIO.new(text)
          end
        end

        # @api private
        #
        # @param query [String, nil]
        #
        # @return [Hash{String=>Array<String>}]
        def decode_query(query)
          CGI.parse(query.to_s)
        end

        # @api private
        #
        # @param lhs [Object]
        # @param rhs [Object]
        # @param concat [Boolean]
        #
        # @return [Object]
        private def deep_merge_lr(lhs, rhs, concat: false)
          case [lhs, rhs, concat]
          in [Hash, Hash, _]
            lhs.merge(rhs) { deep_merge_lr(_2, _3, concat: concat) }
          in [Array, Array, true]
            lhs.concat(rhs)
          else
            rhs
          end
        end

        # @api private
        #
        # Recursively merge one hash with another. If the values at a given key are not
        # both hashes, just take the new value.
        #
        # @param values [Array<Object>]
        #
        # @param sentinel [Object, nil] the value to return if no values are provided.
        #
        # @param concat [Boolean] whether to merge sequences by concatenation.
        #
        # @return [Object]
        def deep_merge(*values, sentinel: nil, concat: false)
          case values
          in [value, *values]
            values.reduce(value) do |acc, val|
              deep_merge_lr(acc, val, concat: concat)
            end
          else
            sentinel
          end
        end

        # @api private
        #
        # @param data [Hash{Symbol=>Object}, Array<Object>, Object]
        # @param pick [Symbol, Integer, Array<Symbol, Integer>, nil]
        # @param sentinel [Object, nil]
        # @param blk [Proc, nil]
        #
        # @return [Object, nil]
        def dig(data, pick, sentinel = nil, &blk)
          case [data, pick, blk]
          in [_, nil, nil]
            data
          in [Hash, Symbol, _] | [Array, Integer, _]
            blk.nil? ? data.fetch(pick, sentinel) : data.fetch(pick, &blk)
          in [Hash | Array, Array, _]
            pick.reduce(data) do |acc, key|
              case acc
              in Hash if acc.key?(key)
                acc.fetch(key)
              in Array if key.is_a?(Integer) && key < acc.length
                acc[key]
              else
                return blk.nil? ? sentinel : blk.call
              end
            end
          in _
            blk.nil? ? sentinel : blk.call
          end
        end

        # @api private
        #
        # @param headers [Hash{String=>String}]
        # @param body [Object]
        #
        # @return [Object]
        def encode_content(headers, body)
          content_type = headers["content-type"]
          body = body.inner if body.is_a?(Pangea::Internal::Util::SerializationAdapter)

          case [content_type, body]
          in [%r{^application/(?:vnd\.api\+)?json}, Hash | Array | -> { primitive?(_1) }]
            [headers, JSON.generate(body)]
          in [%r{^application/(?:x-)?jsonl}, Enumerable] unless body.is_a?(StringIO) || body.is_a?(IO)
            [headers, body.lazy.map { JSON.generate(_1) }]
          in [%r{^multipart/form-data}, Hash | Pathname | StringIO | IO]
            boundary, strio = encode_multipart_streaming(body)
            headers = {**headers, "content-type" => "#{content_type}; boundary=#{boundary}"}
            [headers, strio]
          in [_, Symbol | Numeric]
            [headers, body.to_s]
          in [_, StringIO]
            [headers, body.string]
          else
            [headers, body]
          end
        end

        # @api private
        #
        # @param query [Hash{String=>Array<String>, String, nil}, nil]
        #
        # @return [String, nil]
        def encode_query(query)
          query.to_h.empty? ? nil : URI.encode_www_form(query)
        end

        # @api private
        #
        # https://doc.rust-lang.org/std/iter/trait.FusedIterator.html
        #
        # @param enum [Enumerable<Object>]
        # @param external [Boolean]
        # @param close [Proc]
        #
        # @return [Enumerable<Object>]
        def fused_enum(enum, external: false, &close)
          fused = false
          iter = Enumerator.new do |y|
            next if fused

            fused = true
            if external
              loop { y << enum.next }
            else
              enum.each(&y)
            end
          ensure
            close&.call
            close = nil
          end

          iter.define_singleton_method(:rewind) do
            fused = true
            self
          end
          iter
        end

        # @api private
        #
        # @param path [String, Array<String>]
        #
        # @return [String]
        def interpolate_path(path)
          case path
          in String
            path
          in []
            ""
          in [String => p, *interpolations]
            encoded = interpolations.map { ERB::Util.url_encode(_1) }
            format(p, *encoded)
          end
        end

        # @api private
        #
        # @param lhs [Hash{Symbol=>String, Integer, nil}] .
        #
        #   @option lhs [String, nil] :scheme
        #
        #   @option lhs [String, nil] :host
        #
        #   @option lhs [Integer, nil] :port
        #
        #   @option lhs [String, nil] :path
        #
        #   @option lhs [Hash{String=>Array<String>}] :query
        #
        # @param rhs [Hash{Symbol=>String, Integer, nil}] .
        #
        #   @option rhs [String, nil] :scheme
        #
        #   @option rhs [String, nil] :host
        #
        #   @option rhs [Integer, nil] :port
        #
        #   @option rhs [String, nil] :path
        #
        #   @option rhs [Hash{String=>Array<String>}] :query
        #
        # @return [URI::Generic]
        def join_parsed_uri(lhs, rhs)
          base_path, base_query = lhs.fetch_values(:path, :query)
          slashed = base_path.end_with?("/") ? base_path : "#{base_path}/"

          parsed_path, parsed_query = parse_uri(rhs.fetch(:path)).fetch_values(:path, :query)
          override = URI::Generic.build(**rhs.slice(:scheme, :host, :port), path: parsed_path)

          joined = URI.join(URI::Generic.build(lhs.except(:path, :query)), slashed, override)
          query = deep_merge(
            joined.path == base_path ? base_query : {},
            parsed_query,
            rhs[:query].to_h,
            concat: true
          )

          joined.query = encode_query(query)
          joined
        end

        # @api private
        #
        # @param headers [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}]
        #
        # @return [Hash{String=>String}]
        def normalized_headers(*headers)
          {}.merge(*headers.compact).to_h do |key, val|
            value =
              case val
              in Array
                val.filter_map { _1&.to_s&.strip }.join(", ")
              else
                val&.to_s&.strip
              end
            [key.downcase, value]
          end
        end

        # @api private
        #
        # @param url [URI::Generic, String]
        #
        # @return [Hash{Symbol=>String, Integer, nil}]
        def parse_uri(url)
          parsed = URI::Generic.component.zip(URI.split(url)).to_h
          {**parsed, query: decode_query(parsed.fetch(:query))}
        end

        # @api private
        #
        # @param uri [URI::Generic]
        #
        # @return [String]
        def uri_origin(uri)
          "#{uri.scheme}://#{uri.host}#{uri.port == uri.default_port ? '' : ":#{uri.port}"}"
        end
      end

      # @api private
      class SerializationAdapter
        # @return [Pathname, IO]
        attr_reader :inner

        # @param a [Object]
        #
        # @return [String]
        def to_json(*a) = (inner.is_a?(IO) ? inner.read : inner.read(binmode: true)).to_json(*a)

        # @param a [Object]
        #
        # @return [String]
        def to_yaml(*a) = (inner.is_a?(IO) ? inner.read : inner.read(binmode: true)).to_yaml(*a)

        # @api private
        #
        # @param inner [Pathname, IO]
        def initialize(inner) = @inner = inner
      end

      # @api private
      #
      # An adapter that satisfies the IO interface required by `::IO.copy_stream`
      class ReadIOAdapter
        # @api private
        #
        # @return [Boolean, nil]
        def close? = @closing

        # @api private
        def close
          case @stream
          in Enumerator
            Pangea::Internal::Util.close_fused!(@stream)
          in IO if close?
            @stream.close
          else
          end
        end

        # @api private
        #
        # @param max_len [Integer, nil]
        #
        # @return [String]
        private def read_enum(max_len)
          case max_len
          in nil
            @stream.to_a.join
          in Integer
            @buf << @stream.next while @buf.length < max_len
            @buf.slice!(..max_len)
          end
        rescue StopIteration
          @stream = nil
          @buf.slice!(0..)
        end

        # @api private
        #
        # @param max_len [Integer, nil]
        # @param out_string [String, nil]
        #
        # @return [String, nil]
        def read(max_len = nil, out_string = nil)
          case @stream
          in nil
            nil
          in IO | StringIO
            @stream.read(max_len, out_string)
          in Enumerator
            read = read_enum(max_len)
            case out_string
            in String
              out_string.replace(read)
            in nil
              read
            end
          end
            .tap(&@blk)
        end

        # @api private
        #
        # @param src [String, Pathname, StringIO, Enumerable<String>]
        # @param blk [Proc]
        #
        # @yieldparam [String]
        def initialize(src, &blk)
          @stream =
            case src
            in String
              StringIO.new(src)
            in Pathname
              @closing = true
              src.open(binmode: true)
            else
              src
            end
          @buf = String.new
          @blk = blk
        end
      end
    end
  end
end

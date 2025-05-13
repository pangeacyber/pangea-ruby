# frozen_string_literal: true

module Pangea
  class RequestOptions < Pangea::Internal::Type::BaseModel
    # @api private
    #
    # @param opts [Pangea::RequestOptions, Hash{Symbol=>Object}]
    #
    # @raise [ArgumentError]
    def self.validate!(opts)
      case opts
      in Pangea::RequestOptions | Hash
        opts.to_h.each_key do |k|
          unless fields.include?(k)
            raise ArgumentError.new("Request `opts` keys must be one of #{fields.keys}, got #{k.inspect}")
          end
        end
      else
        raise ArgumentError.new("Request `opts` must be a Hash or RequestOptions, got #{opts.inspect}")
      end
    end

    # @!attribute max_retries
    #   Maximum number of retries to attempt after a failed initial request.
    #
    #   @return [Integer, nil]
    optional :max_retries, Integer

    # @!attribute timeout
    #   Request timeout in seconds.
    #
    #   @return [Float, nil]
    optional :timeout, Float
  end
end

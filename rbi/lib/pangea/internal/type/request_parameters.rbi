# typed: strong

module Pangea
  module Internal
    module Type
      # @api private
      module RequestParameters
        sig { returns(T.any(Pangea::RequestOptions, T::Hash[Symbol, T.anything])) }
        attr_accessor :request_options

        # @api private
        module Converter
          # @api private
          sig { params(params: T.anything).returns([T.anything, T::Hash[Symbol, T.anything]]) }
          def dump_request(params); end
        end
      end
    end
  end
end

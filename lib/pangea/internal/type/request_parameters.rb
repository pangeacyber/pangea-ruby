# frozen_string_literal: true

module Pangea
  module Internal
    module Type
      # @api private
      module RequestParameters
        def self.included(mod)
          raise ArgumentError.new(mod) unless mod <= Pangea::Internal::Type::BaseModel

          mod.optional(:request_options, Pangea::RequestOptions)
        end

        # @api private
        module Converter
          # @api private
          def dump_request(params)
            state = {can_retry: true}
            case (dumped = dump(params, state: state))
            in Hash
              options = Pangea::Internal::Util.coerce_hash(dumped[:request_options])
              request_options =
                case [options, state.fetch(:can_retry)]
                in [Hash | nil, false]
                  {**options.to_h, max_retries: 0}
                else
                  options
                end
              [dumped.except(:request_options), request_options]
            else
              [dumped, nil]
            end
          end
        end
      end
    end
  end
end

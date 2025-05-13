# typed: strong

module Pangea
  module Internal
    # @api private
    module Util
      class << self
        # @api private
        sig do
          params(input: T.anything).returns(
            T.any(T::Hash[T.anything, T.anything], T.anything)
          )
        end
        def coerce_hash(input)
        end

        # @api private
        sig do
          params(input: T.anything).returns(
            T.nilable(T::Hash[T.anything, T.anything])
          )
        end
        def coerce_hash!(input)
        end
      end
    end
  end
end

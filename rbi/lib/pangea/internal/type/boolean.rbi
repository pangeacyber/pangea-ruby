# typed: strong

module Pangea
  module Internal
    module Type
      # @api private
      class Boolean
        extend Pangea::Internal::Type::Converter

        abstract!

        sig { params(other: T.anything).returns(T::Boolean) }
        def self.===(other); end

        sig { params(other: T.anything).returns(T::Boolean) }
        def self.==(other); end

        class << self
          # @api private
          sig do
            override
              .params(value: T.any(
                T::Boolean,
                T.anything
              ),
                      state: Pangea::Internal::Type::Converter::CoerceState)
              .returns(T.any(T::Boolean, T.anything))
          end
          def coerce(value, state:); end

          # @api private
          sig do
            override
              .params(value: T.any(
                T::Boolean,
                T.anything
              ),
                      state: Pangea::Internal::Type::Converter::DumpState)
              .returns(T.any(T::Boolean, T.anything))
          end
          def dump(value, state:); end
        end
      end
    end
  end
end

# typed: strong

module Pangea
  module Internal
    module Type
      module Converter
        Input = T.type_alias { T.any(Pangea::Internal::Type::Converter, T::Class[T.anything]) }

        CoerceState =
          T.type_alias do
            {
              strictness: T.any(T::Boolean, Symbol),
              exactness: {yes: Integer, no: Integer, maybe: Integer},
              branched: Integer
            }
          end

        DumpState = T.type_alias { {can_retry: T::Boolean} }

        # @api private
        sig do
          overridable
            .params(value: T.anything, state: Pangea::Internal::Type::Converter::CoerceState)
            .returns(T.anything)
        end
        def coerce(value, state:); end

        # @api private
        sig do
          overridable
            .params(value: T.anything, state: Pangea::Internal::Type::Converter::DumpState)
            .returns(T.anything)
        end
        def dump(value, state:); end
      end
    end
  end
end

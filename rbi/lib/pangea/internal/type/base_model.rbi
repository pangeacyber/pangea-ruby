# typed: strong

module Pangea
  module Internal
    module Type
      class BaseModel
        abstract!

        KnownFieldShape = T.type_alias do
          {mode: T.nilable(Symbol), required: T::Boolean, nilable: T::Boolean}
        end

        sig { params(keys: T.nilable(T::Array[Symbol])).returns(T::Hash[Symbol, T.anything]) }
        def deconstruct_keys(keys); end

        class << self
          sig do
            returns(
              T::Hash[
                Symbol,
                T.all(
                  Pangea::Internal::Type::BaseModel::KnownFieldShape,
                  {type_fn: T.proc.returns(Pangea::Internal::Type::Converter::Input)}
                )
              ]
            )
          end
          def known_fields; end
        end
      end
    end
  end
end

# typed: strong

module Pangea
  module Internal
    module Type
      # @api private
      #
      # Array of items of a given type.
      class ArrayOf
        include Pangea::Internal::Type::Converter

        abstract!

        Elem = type_member(:out)

        sig do
          params(
            type_info: T.any(
              T::Hash[Symbol, T.anything],
              T.proc.returns(Pangea::Internal::Type::Converter::Input),
              Pangea::Internal::Type::Converter::Input
            ),
            spec: T::Hash[Symbol, T.anything]
          )
            .returns(T.attached_class)
        end
        def self.[](type_info, spec = {}); end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ===(other); end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ==(other); end

        sig { returns(Integer) }
        def hash; end

        # @api private
        sig { returns(Elem) }
        protected def item_type; end

        # @api private
        sig { returns(T::Boolean) }
        protected def nilable?; end

        # @api private
        sig do
          params(
            type_info: T.any(
              T::Hash[Symbol, T.anything],
              T.proc.returns(Pangea::Internal::Type::Converter::Input),
              Pangea::Internal::Type::Converter::Input
            ),
            spec: T::Hash[Symbol, T.anything]
          )
            .void
        end
        def initialize(type_info, spec = {}); end

        # @api private
        sig { params(depth: Integer).returns(String) }
        def inspect(depth: 0); end
      end
    end
  end
end

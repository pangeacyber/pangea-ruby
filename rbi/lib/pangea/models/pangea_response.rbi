# typed: strong

module Pangea
  module Models
    class PangeaResponse < Pangea::Internal::Type::BaseModel
      Result = type_member(:out)

      # @api private
      sig { returns(Result) }
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
    end
  end
end

# typed: strong

module Pangea
  module Internal
    module Type
      module Union
        include Pangea::Internal::Type::Converter

        # @api private
        sig do
          params(
            key: T.any(Symbol, T::Hash[Symbol, T.anything], T.proc.returns(T.anything), T.anything),
            spec: T.any(T::Hash[Symbol, T.anything], T.proc.returns(T.anything), T.anything)
          )
            .void
        end
        private def variant(key, spec = nil); end
      end
    end
  end
end

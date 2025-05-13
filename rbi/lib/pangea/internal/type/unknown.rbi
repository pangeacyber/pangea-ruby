# typed: strong

module Pangea
  module Internal
    module Type
      # @api private
      class Unknown
        extend Pangea::Internal::Type::Converter

        abstract!

        sig { params(other: T.anything).returns(T::Boolean) }
        def self.===(other); end

        sig { params(other: T.anything).returns(T::Boolean) }
        def self.==(other); end
      end
    end
  end
end

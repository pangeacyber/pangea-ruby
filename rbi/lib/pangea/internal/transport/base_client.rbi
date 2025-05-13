# typed: strong

module Pangea
  module Internal
    module Transport
      # @api private
      class BaseClient
        abstract!

        PLATFORM_HEADERS = T::Hash[String, String]

        # @api private
        sig { overridable.returns(T::Hash[String, String]) }
        private def auth_headers; end
      end
    end
  end
end

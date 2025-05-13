# typed: strong

module Pangea
  module Services
    class AiGuard
      sig do
        params(
          text: T.nilable(String),
          messages: T.nilable(T::Array[Pangea::Models::AiGuard::TextGuardMessageParam]),
          recipe: T.nilable(String),
          debug: T.nilable(T::Boolean),
          request_options: T.nilable(T.any(Pangea::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Pangea::Models::PangeaResponse[Pangea::Models::AiGuard::TextGuardResult])
      end
      def guard_text(
        text:,
        messages:,
        recipe:,
        debug:,
        request_options: {}
      ); end
      # @api private
      sig { params(api_token: T.nilable(String), base_url: T.nilable(String), domain: T.nilable(String)).returns(T.attached_class) }
      def self.new(api_token: nil, base_url: nil, domain: nil); end
    end
  end
end

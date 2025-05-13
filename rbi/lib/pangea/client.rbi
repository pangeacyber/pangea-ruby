# typed: strong

module Pangea
  class Client < Pangea::Internal::Transport::BaseClient
    sig { returns(String) }
    attr_reader :api_token

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers; end

    # Creates and returns a new client for interacting with the Pangea API.
    sig do
      params(
        api_token: T.nilable(String),
        base_url: T.nilable(String)
      )
        .returns(T.attached_class)
    end
    def self.new(
      api_token: nil,
      base_url: nil
    ); end
  end
end

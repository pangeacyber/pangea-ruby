# frozen_string_literal: true

module Pangea
  class Client < Pangea::Internal::Transport::BaseClient
    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 600.0

    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # @return [String]
    attr_reader :api_token

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_token.nil?

      {"authorization" => "Bearer #{@api_token}"}
    end

    # Creates and returns a new client for interacting with the Pangea API.
    #
    # @param api_token [String]
    # @param base_url [String]
    # @param max_retries [Integer] Max number of retries to attempt after a
    #   failed retryable request.
    def initialize(
      api_token:,
      base_url:,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS
    )
      @api_token = api_token&.to_s

      super(
        base_url: base_url,
        initial_retry_delay: initial_retry_delay,
        max_retries: max_retries,
        headers: {},
        timeout: timeout
      )
    end
  end
end

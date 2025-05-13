# frozen_string_literal: true

module Pangea
  module Services
    class AiGuard
      # Creates and returns a new client for interacting with the
      # Pangea AI Guard API.
      #
      # @param api_token [String, nil]
      # @param base_url [String, nil]
      # @param domain [String, nil]
      def initialize(
        api_token: nil,
        base_url: nil,
        domain: nil
      )
        if !base_url && domain
          base_url = "https://ai-guard.#{domain}"
        end

        base_url ||= "https://ai-guard.aws.us.pangea.cloud"

        @client = Pangea::Client.new(api_token: api_token, base_url: base_url)
      end

      # Analyze and redact text to avoid manipulation of the model, addition of
      # malicious content, and other undesirable data transfers.
      #
      # @overload guard_text(text:, recipe:, debug:, request_options: {})
      # @overload guard_text(messages:, recipe:, debug:, request_options: {})
      #
      # @param text [String, nil] Text to be scanned by AI Guard for PII,
      #   sensitive data, malicious content, and other data types defined by the
      #   configuration. Supports processing up to 20 KiB of text.
      # @param messages [Array<Pangea::Models::AiGuard::TextGuardMessageParam>, nil]
      #   Structured messages data to be scanned by AI Guard for PII, sensitive
      #   data, malicious content, and other data types defined by the
      #   configuration. Supports processing up to 20 KiB of JSON text using
      #   Pangea message format.
      # @param recipe [String, nil] Recipe key of a configuration of data types
      #   and settings defined in the Pangea User Console. It specifies the
      #   rules that are to be applied to the text, such as defang malicious
      #   URLs.
      # @param debug [Boolean, nil] Setting this value to true will provide a
      #   detailed analysis of the text data.
      # @param request_options [Pangea::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Pangea::Models::PangeaResponse<Pangea::Models::AiGuard::TextGuardResult>]
      def guard_text(params)
        parsed, options = Pangea::Models::AiGuard::TextGuardParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/text/guard",
          body: parsed,
          structure: Pangea::Models::PangeaResponse,
          model: Pangea::Models::AiGuard::TextGuardResult,
          options: options
        )
      end
    end
  end
end

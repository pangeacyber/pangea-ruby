# frozen_string_literal: true

module Pangea
  module Errors
    class Error < StandardError
      # @!parse
      #   # @return [StandardError, nil]
      #   attr_accessor :cause
    end

    class ConversionError < Pangea::Errors::Error
    end

    class APIError < Pangea::Errors::Error
      # @return [URI::Generic]
      attr_accessor :url

      # @return [Integer, nil]
      attr_accessor :status

      # @return [Object, nil]
      attr_accessor :body

      # @return [String, nil]
      attr_accessor :code

      # @return [String, nil]
      attr_accessor :param

      # @return [String, nil]
      attr_accessor :type

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: nil)
        @url = url
        @status = status
        @body = body
        @request = request
        @response = response
        super(message)
      end
    end

    class APIConnectionError < Pangea::Errors::APIError
      # @!parse
      #   # @return [nil]
      #   attr_accessor :status

      # @!parse
      #   # @return [nil]
      #   attr_accessor :body

      # @!parse
      #   # @return [nil]
      #   attr_accessor :code

      # @!parse
      #   # @return [nil]
      #   attr_accessor :param

      # @!parse
      #   # @return [nil]
      #   attr_accessor :type

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Connection error."
      )
        super
      end
    end

    class APITimeoutError < Pangea::Errors::APIConnectionError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Request timed out."
      )
        super
      end
    end
  end
end

# frozen_string_literal: true

module Pangea
  module Models
    # @generic Result
    class PangeaResponse
      # A unique identifier assigned to each request made to the API. It is used
      # to track and identify a specific request and its associated data. The
      # `request_id` can be helpful for troubleshooting, auditing, and tracing
      # the flow of requests within the system. It allows users to reference and
      # retrieve information related to a particular request, such as the
      # response, parameters, and raw data associated with that specific
      # request.
      #
      # @return [String]
      attr_accessor :request_id

      # The timestamp indicates the exact moment when a request is made to the
      # API. It represents the date and time at which the request was initiated
      # by the client. The `request_time` is useful for tracking and analyzing
      # the timing of requests, measuring response times, and monitoring
      # performance metrics. It allows users to determine the duration between
      # the request initiation and the corresponding response, aiding in the
      # assessment of API performance and latency.
      #
      # @return [String]
      attr_accessor :request_time

      # Duration it takes for the API to process a request and generate a
      # response. It represents the elapsed time from when the request is
      # received by the API to when the corresponding response is returned to
      # the client.
      #
      # @return [String]
      attr_accessor :response_time

      # It represents the status or outcome of the API request made for IP
      # information. It indicates the current state or condition of the request
      # and provides information on the success or failure of the request.
      #
      # @return [String]
      attr_accessor :status

      # Provides a concise and brief overview of the purpose or primary
      # objective of the API endpoint. It serves as a high-level summary or
      # description of the functionality or feature offered by the endpoint.
      #
      # @return [String]
      attr_accessor :summary

      # @return [generic<Result> | nil]
      attr_accessor :result

      # @api private
      #
      # @param response_data [Hash{Symbol=>Object}]
      def initialize(response_data:, model:)
        @request_id = response_data[:request_id]
        @request_time = response_data[:request_time]
        @response_time = response_data[:response_time]
        @status = response_data[:status]
        @summary = response_data[:summary]
        @result = Pangea::Internal::Type::Converter.coerce(model, response_data[:result])
      end
    end
  end
end

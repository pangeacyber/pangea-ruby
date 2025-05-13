# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class HardeningResult < Pangea::Internal::Type::BaseModel
        # @!attribute action
        #   The action taken by this Detector
        #
        #   @return [String, nil]
        optional :action, String, nil?: true

        # @!attribute message
        #   Descriptive information about the hardening detector execution
        #
        #   @return [String, nil]
        optional :message, String, nil?: true

        # @!attribute token_count
        #   Number of tokens counted in the last user prompt
        #
        #   @return [Integer, nil]
        optional :token_count, Integer, nil?: true
      end
    end
  end
end

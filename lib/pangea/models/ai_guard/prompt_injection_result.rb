# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class PromptInjectionResult < Pangea::Internal::Type::BaseModel
        # @!attribute action
        #   The action taken by this Detector
        #
        #   @return [String, nil]
        optional :action, String, nil?: true

        # @!attribute analyzer_responses
        #   Triggered prompt injection analyzers.
        #
        #   @return [Pangea::Internal::Type::ArrayOf<AnalyzerResponse>, nil]
        optional :analyzer_responses, Pangea::Internal::Type::ArrayOf[-> { AnalyzerResponse }], nil?: true

        class AnalyzerResponse < Pangea::Internal::Type::BaseModel
          # @!attribute analyzer
          #
          #   @return [String, nil]
          optional :analyzer, String, nil?: true

          # @!attribute confidence
          #
          #   @return [Float, nil]
          optional :confidence, Float, nil?: true
        end
      end
    end
  end
end

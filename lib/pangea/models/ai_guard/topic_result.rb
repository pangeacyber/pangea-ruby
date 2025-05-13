# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class TopicResult < Pangea::Internal::Type::BaseModel
        # @!attribute action
        #   The action taken by this Detector
        #
        #   @return [String, nil]
        optional :action, String, nil?: true

        # @!attribute topics
        #   List of topics detected
        #
        #   @return [Pangea::Internal::Type::ArrayOf<Topic>, nil]
        optional :topics, Pangea::Internal::Type::ArrayOf[-> { Topic }], nil?: true

        class Topic < Pangea::Internal::Type::BaseModel
          # @!attribute topic
          #
          #   @return [String]
          required :topic, String

          # @!attribute confidence
          #
          #   @return [Float]
          required :confidence, Float
        end
      end
    end
  end
end

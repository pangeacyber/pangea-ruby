# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class ClassificationResult < Pangea::Internal::Type::BaseModel
        # @!attribute action
        #   The action taken by this Detector
        #
        #   @return [String, nil]
        optional :action, String, nil?: true

        # @!attribute classifications
        #   Triggered classifications.
        #
        #   @return [Pangea::Internal::Type::ArrayOf<Classification>, nil]
        optional :classifications, Pangea::Internal::Type::ArrayOf[-> { Classification }], nil?: true

        class Classification < Pangea::Internal::Type::BaseModel
          # @!attribute category
          #
          #   @return [String]
          required :category, String

          # @!attribute confidence
          #
          #   @return [Float]
          required :confidence, Float
        end
      end
    end
  end
end

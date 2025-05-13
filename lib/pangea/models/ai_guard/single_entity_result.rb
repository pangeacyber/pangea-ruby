# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class SingleEntityResult < Pangea::Internal::Type::BaseModel
        # @!attribute action
        #   The action taken by this Detector
        #
        #   @return [String, nil]
        optional :action, String, nil?: true

        # @!attribute entities
        #   Detected entities.
        #
        #   @return [Pangea::Internal::Type::ArrayOf<String>, nil]
        optional :entities, Pangea::Internal::Type::ArrayOf[String], nil?: true
      end
    end
  end
end

# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class LanguageResult < Pangea::Internal::Type::BaseModel
        # @!attribute action
        #   The action taken by this Detector
        #
        #   @return [String, nil]
        optional :action, String, nil?: true

        # @!attribute language
        #
        #   @return [String, nil]
        optional :language, String, nil?: true
      end
    end
  end
end

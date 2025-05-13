# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class TextGuardMessageParam < Pangea::Internal::Type::BaseModel
        # @!attribute role
        #
        #   @return [String]
        required :role, String

        # @!attribute content
        #
        #   @return [String]
        required :content, String
      end
    end
  end
end

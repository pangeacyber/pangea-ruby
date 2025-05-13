# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class RedactEntityResult < Pangea::Internal::Type::BaseModel
        # @!attribute entities
        #   Detected redaction rules.
        #
        #   @return [Pangea::Internal::Type::ArrayOf<Entity>, nil]
        optional :entities, Pangea::Internal::Type::ArrayOf[-> { Entity }], nil?: true

        class Entity < Pangea::Internal::Type::BaseModel
          # @!attribute action
          #   The action taken on this Entity
          #
          #   @return [String]
          required :action, String

          # @!attribute type
          #
          #   @return [String]
          required :type, String

          # @!attribute value
          #
          #   @return [String]
          required :value, String

          # @!attribute redacted
          #
          #   @return [Pangea::Internal::Type::Boolean]
          required :redacted, Pangea::Internal::Type::Boolean

          # @!attribute start_pos
          #
          #   @return [Integer, nil]
          optional :start_pos, Integer, nil?: true
        end
      end
    end
  end
end

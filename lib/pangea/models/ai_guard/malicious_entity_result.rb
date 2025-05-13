# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class MaliciousEntityResult < Pangea::Internal::Type::BaseModel
        # @!attribute entities
        #   Detected harmful items.
        #
        #   @return [Pangea::Internal::Type::ArrayOf<Entity>, nil]
        optional :entities, Pangea::Internal::Type::ArrayOf[-> { Entity }], nil?: true

        class Entity < Pangea::Internal::Type::BaseModel
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
          #   @return [Pangea::Internal::Type::Boolean, nil]
          optional :redacted, Pangea::Internal::Type::Boolean, nil?: true

          # @!attribute start_pos
          #
          #   @return [Integer, nil]
          optional :start_pos, Integer, nil?: true

          # @!attribute raw
          #
          #   @return [Hash, nil]
          optional :raw, Hash, nil?: true
        end
      end
    end
  end
end

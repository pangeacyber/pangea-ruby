# typed: strong

module Pangea
  module Models
    module AiGuard
      class TextGuardMessageParam < Pangea::Internal::Type::BaseModel
        sig { returns(T.nilable(String)) }
        attr_reader :role

        sig { returns(T.nilable(String)) }
        attr_reader :content
      end
    end
  end
end

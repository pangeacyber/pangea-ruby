# typed: strong

module Pangea
  module Models
    module AiGuard
      class TextGuardResult < Pangea::Internal::Type::BaseModel
        # Updated prompt text, if applicable.
        sig { returns(T.nilable(String)) }
        attr_reader :prompt_text
      end
    end
  end
end

# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class TextGuardParams < Pangea::Internal::Type::BaseModel
        extend Pangea::Internal::Type::RequestParameters::Converter
        include Pangea::Internal::Type::RequestParameters

        optional :text, String, nil?: true

        # module Prompt
        #   extend Pangea::Internal::Type::Union

        #   variant String

        #   variant -> { Pangea::Models::TextGuardParams::Prompt::StringArray }

        #   StringArray = Array(String)
        # end
      end
    end
  end
end

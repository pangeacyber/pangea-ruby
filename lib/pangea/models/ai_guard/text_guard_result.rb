# frozen_string_literal: true

module Pangea
  module Models
    module AiGuard
      class TextGuardResult < Pangea::Internal::Type::BaseModel
        # @!attribute detectors
        #   Result of the recipe analyzing and input prompt.
        #
        #   @return [Detectors]
        required :detectors, -> { Detectors }

        # @!attribute prompt_text
        #   Updated prompt text, if applicable.
        #
        #   @return [String, nil]
        optional :prompt_text, String, nil?: true

        # @!attribute prompt_messages
        #   Updated structured prompt, if applicable.
        #
        #   @return [Pangea::Internal::Type::Unknown, nil]
        optional :prompt_messages, Hash, nil?: true

        # @!attribute blocked
        #   Whether or not the prompt triggered a block detection.
        #
        #   @return [Boolean, nil]
        optional :blocked, Pangea::Internal::Type::Boolean, nil?: true

        # @!attribute recipe
        #   The Recipe that was used.
        #
        #   @return [String, nil]
        optional :recipe, String, nil?: true

        # @!attribute fpe_context
        #   If an FPE redaction method returned results, this will be the
        #   context passed to unredact.
        #
        #   @return [String, nil]
        optional :fpe_context, String, nil?: true

        class Detectors < Pangea::Internal::Type::BaseModel
          # @!attribute prompt_injection
          #
          #   @return [PromptInjectionResult, nil]
          optional :prompt_injection, -> { PromptInjection }, nil?: true

          # @!attribute gibberish
          #
          #   @return [Gibberish, nil]
          optional :gibberish, -> { Gibberish }, nil?: true

          # @!attribute sentiment
          #
          #   @return [Sentiment, nil]
          optional :sentiment, -> { Sentiment }, nil?: true

          # @!attribute selfharm
          #
          #   @return [SelfHarm, nil]
          optional :selfharm, -> { SelfHarm }, nil?: true

          # @!attribute pii_entity
          #
          #   @return [PiiEntity, nil]
          optional :pii_entity, -> { PiiEntity }, nil?: true

          # @!attribute malicious_entity
          #
          #   @return [MaliciousEntity, nil]
          optional :malicious_entity, -> { MaliciousEntity }, nil?: true

          # @!attribute custom_entity
          #
          #   @return [CustomEntity, nil]
          optional :custom_entity, -> { CustomEntity }, nil?: true

          # @!attribute secrets_detection
          #
          #   @return [SecretsDetection, nil]
          optional :secrets_detection, -> { SecretsDetection }, nil?: true

          # @!attribute competitors
          #
          #   @return [Competitors, nil]
          optional :competitors, -> { Competitors }, nil?: true

          # @!attribute profanity_and_toxicity
          #
          #   @return [ProfanityAndToxicity, nil]
          optional :profanity_and_toxicity, -> { ProfanityAndToxicity }, nil?: true

          # @!attribute hardening
          #
          #   @return [Hardening, nil]
          optional :hardening, -> { Hardening }, nil?: true

          # @!attribute language_detection
          #
          #   @return [LanguageDetection, nil]
          optional :language_detection, -> { LanguageDetection }, nil?: true

          # @!attribute topic
          #
          #   @return [Topic, nil]
          optional :topic, -> { Topic }, nil?: true

          # @!attribute code_detection
          #
          #   @return [CodeDetection, nil]
          optional :code_detection, -> { CodeDetection }, nil?: true

          class PromptInjection < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Malicious Prompt was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the analyzers.
            #
            #   @return [Pangea::Models::AiGuard::PromptInjectionResult, nil]
            optional :data, Pangea::Models::AiGuard::PromptInjectionResult, nil?: true
          end

          class Gibberish < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Gibberish was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the analyzers.
            #
            #   @return [Pangea::Models::AiGuard::ClassificationResult, nil]
            optional :data, Pangea::Models::AiGuard::ClassificationResult, nil?: true
          end

          class Sentiment < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Negative Sentiment was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the analyzers.
            #
            #   @return [Pangea::Models::AiGuard::ClassificationResult, nil]
            optional :data, Pangea::Models::AiGuard::ClassificationResult, nil?: true
          end

          class SelfHarm < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Self-harm was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the analyzers.
            #
            #   @return [Pangea::Models::AiGuard::ClassificationResult, nil]
            optional :data, Pangea::Models::AiGuard::ClassificationResult, nil?: true
          end

          class PiiEntity < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the PII Entities was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected entities
            #
            #   @return [Pangea::Models::AiGuard::RedactEntityResult, nil]
            optional :data, Pangea::Models::AiGuard::RedactEntityResult, nil?: true
          end

          class MaliciousEntity < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Malicious Entities was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected entities
            #
            #   @return [Pangea::Models::AiGuard::MaliciousEntityResult, nil]
            optional :data, Pangea::Models::AiGuard::MaliciousEntityResult, nil?: true
          end

          class CustomEntity < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Custom Entities was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected entities
            #
            #   @return [Pangea::Models::AiGuard::RedactEntityResult, nil]
            optional :data, Pangea::Models::AiGuard::RedactEntityResult, nil?: true
          end

          class SecretsDetection < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Secret Entities was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected entities
            #
            #   @return [Pangea::Models::AiGuard::RedactEntityResult, nil]
            optional :data, Pangea::Models::AiGuard::RedactEntityResult, nil?: true
          end

          class Competitors < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Competitors was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected entities
            #
            #   @return [Pangea::Models::AiGuard::SingleEntityResult, nil]
            optional :data, Pangea::Models::AiGuard::SingleEntityResult, nil?: true
          end

          class ProfanityAndToxicity < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Profanity and Toxic was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected entities.
            #
            #   @return [Pangea::Models::AiGuard::ClassificationResult, nil]
            optional :data, Pangea::Models::AiGuard::ClassificationResult, nil?: true
          end

          class Hardening < Pangea::Internal::Type::BaseModel
            # @!attribute data
            #   Details about the detected languages.
            #
            #   @return [Pangea::Models::AiGuard::HardeningResult, nil]
            optional :data, Pangea::Models::AiGuard::HardeningResult, nil?: true
          end

          class LanguageDetection < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Languages was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected languages.
            #
            #   @return [Pangea::Models::AiGuard::LanguageResult, nil]
            optional :data, Pangea::Models::AiGuard::LanguageResult, nil?: true
          end

          class Topic < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Topics was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected topics.
            #
            #   @return [Pangea::Models::AiGuard::TopicResult, nil]
            optional :data, Pangea::Models::AiGuard::TopicResult, nil?: true
          end

          class CodeDetection < Pangea::Internal::Type::BaseModel
            # @!attribute detected
            #   Whether or not the Code was detected.
            #
            #   @return [Pangea::Internal::Type::Boolean, nil]
            optional :detected, Pangea::Internal::Type::Boolean, nil?: true

            # @!attribute data
            #   Details about the detected code.
            #
            #   @return [Pangea::Models::AiGuard::LanguageResult, nil]
            optional :data, Pangea::Models::AiGuard::LanguageResult, nil?: true
          end
        end
      end
    end
  end
end

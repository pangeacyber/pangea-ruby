# frozen_string_literal: true

module Pangea
  module Internal
    module Type
      # @api private
      #
      # @abstract
      class Unknown
        extend Pangea::Internal::Type::Converter

        private_class_method :new

        # rubocop:disable Lint/UnusedMethodArgument

        # @param other [Object]
        #
        # @return [Boolean]
        def self.===(other) = true

        # rubocop:enable Lint/UnusedMethodArgument

        # @param other [Object]
        #
        # @return [Boolean]
        def self.==(other) = other.is_a?(Class) && other <= Pangea::Internal::Type::Unknown

        class << self
          # @api private
          #
          # @param value [Object]
          #
          # @param state [Hash{Symbol=>Object}] .
          #
          #   @option state [Boolean, :strong] :strictness
          #
          #   @option state [Hash{Symbol=>Object}] :exactness
          #
          #   @option state [Integer] :branched
          #
          # @return [Object]
          def coerce(value, state:)
            state.fetch(:exactness)[:yes] += 1
            value
          end
        end
      end
    end
  end
end

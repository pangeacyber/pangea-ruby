# frozen_string_literal: true

module Pangea
  module Internal
    module Type
      # @api private
      class Boolean
        extend Pangea::Internal::Type::Converter

        private_class_method :new

        # @param other [Object]
        #
        # @return [Boolean]
        def self.===(other) = other == true || other == false

        # @param other [Object]
        #
        # @return [Boolean]
        def self.==(other) = other.is_a?(Class) && other <= Pangea::Internal::Type::Boolean

        class << self
          # @api private
          #
          # @param value [Boolean, Object]
          #
          # @param state [Hash{Symbol=>Object}] .
          #
          #   @option state [Boolean, :strong] :strictness
          #
          #   @option state [Hash{Symbol=>Object}] :exactness
          #
          #   @option state [Integer] :branched
          #
          # @return [Boolean, Object]
          def coerce(value, state:)
            state.fetch(:exactness)[value == true || value == false ? :yes : :no] += 1
            value
          end
        end
      end
    end
  end
end

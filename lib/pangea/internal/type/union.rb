# frozen_string_literal: true

module Pangea
  module Internal
    module Type
      # @api private
      module Union
        include Pangea::Internal::Type::Converter

        # @api private
        #
        # All of the specified variant info for this union.
        #
        # @return [Array<Array(Symbol, Proc)>]
        private def known_variants = (@known_variants ||= [])

        # @api private
        #
        # @param key [Symbol, Hash{Symbol=>Object}, Proc, Pangea::Internal::Type::Converter, Class]
        #
        # @param spec [Hash{Symbol=>Object}, Proc, Pangea::Internal::Type::Converter, Class] .
        #
        #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
        #
        #   @option spec [Proc] :enum
        #
        #   @option spec [Proc] :union
        #
        #   @option spec [Boolean] :"nil?"
        private def variant(key, spec = nil)
          variant_info =
            case key
            in Symbol
              [key, Pangea::Internal::Type::Converter.type_info(spec)]
            in Proc | Pangea::Internal::Type::Converter | Class | Hash
              [nil, Pangea::Internal::Type::Converter.type_info(key)]
            end

          known_variants << variant_info
        end

        # @api private
        #
        # @param value [Object]
        #
        # @param state [Hash{Symbol=>Object}] .
        #
        #   @option state [Boolean] :can_retry
        #
        # @return [Object]
        def dump(value, state:)
          if (target = resolve_variant(value))
            return Pangea::Internal::Type::Converter.dump(target, value, state: state)
          end

          known_variants.each do
            target = _2.call
            return Pangea::Internal::Type::Converter.dump(target, value, state: state) if target === value
          end

          super
        end
      end
    end
  end
end

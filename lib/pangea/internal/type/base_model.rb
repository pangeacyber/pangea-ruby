# frozen_string_literal: true

module Pangea
  module Internal
    module Type
      # @abstract
      class BaseModel
        extend Pangea::Internal::Type::Converter

        # @param other [Object]
        #
        # @return [Boolean]
        def ==(other) = self.class == other.class && @data == other.to_h

        # @return [Hash{Symbol=>Object}]
        def to_h = @data

        alias_method :to_hash, :to_h

        # @param keys [Array<Symbol>, nil]
        #
        # @return [Hash{Symbol=>Object}]
        def deconstruct_keys(keys)
          (keys || self.class.known_fields.keys)
            .filter_map do |k|
              unless self.class.known_fields.key?(k)
                next
              end

              [k, public_send(k)]
            end
            .to_h
        end

        class << self
          # @api private
          #
          # @param value [Pangea::Internal::Type::BaseModel, Hash{Object=>Object}, Object]
          #
          # @param state [Hash{Symbol=>Object}] .
          #
          #   @option state [Boolean, :strong] :strictness
          #
          #   @option state [Hash{Symbol=>Object}] :exactness
          #
          #   @option state [Integer] :branched
          #
          # @return [Pangea::Internal::Type::BaseModel, Object]
          def coerce(value, state:)
            exactness = state.fetch(:exactness)

            if value.is_a?(self.class)
              exactness[:yes] += 1
              return value
            end

            unless (val = Pangea::Internal::Util.coerce_hash(value)).is_a?(Hash)
              exactness[:no] += 1
              return value
            end
            exactness[:yes] += 1

            keys = val.keys.to_set
            instance = new
            data = instance.to_h

            # rubocop:disable Metrics/BlockLength
            fields.each do |name, field|
              mode, required, target = field.fetch_values(:mode, :required, :type)
              api_name, nilable, const = field.fetch_values(:api_name, :nilable, :const)

              unless val.key?(api_name)
                if required && mode != :dump && const == Pangea::Internal::OMIT
                  exactness[nilable ? :maybe : :no] += 1
                else
                  exactness[:yes] += 1
                end
                next
              end

              item = val.fetch(api_name)
              keys.delete(api_name)

              converted =
                if item.nil? && (nilable || !required)
                  exactness[nilable ? :yes : :maybe] += 1
                  nil
                else
                  coerced = Pangea::Internal::Type::Converter.coerce(target, item, state: state)
                  case target
                  in Pangea::Internal::Type::Converter | Symbol
                    coerced
                  else
                    item
                  end
                end
              data.store(name, converted)
            end
            # rubocop:enable Metrics/BlockLength

            keys.each { data.store(_1, val.fetch(_1)) }
            instance
          end

          # @api private
          #
          # @param value [Pangea::Internal::Type::BaseModel, Object]
          #
          # @param state [Hash{Symbol=>Object}] .
          #
          #   @option state [Boolean] :can_retry
          #
          # @return [Hash{Object=>Object}, Object]
          def dump(value, state:)
            unless (coerced = Pangea::Internal::Util.coerce_hash(value)).is_a?(Hash)
              return super
            end

            acc = {}

            coerced.each do |key, val|
              name = key.is_a?(String) ? key.to_sym : key
              case (field = known_fields[name])
              in nil
                acc.store(name, super(val, state: state))
              else
                api_name, mode, type_fn = field.fetch_values(:api_name, :mode, :type_fn)
                case mode
                in :coerce
                  next
                else
                  target = type_fn.call
                  acc.store(api_name, Pangea::Internal::Type::Converter.dump(target, val, state: state))
                end
              end
            end

            known_fields.each_value do |field|
              api_name, mode, const = field.fetch_values(:api_name, :mode, :const)
              next if mode == :coerce || acc.key?(api_name) || const == Pangea::Internal::OMIT
              acc.store(api_name, const)
            end

            acc
          end

          # @return [Hash{Symbol=>Hash{Symbol=>Object}}]
          def known_fields
            @known_fields ||= (self < Pangea::Internal::Type::BaseModel ? superclass.known_fields.dup : {})
          end

          # @api private
          #
          # @return [Hash{Symbol=>Hash{Symbol=>Object}}]
          def fields
            known_fields.transform_values do |field|
              {**field.except(:type_fn), type: field.fetch(:type_fn).call}
            end
          end

          # @api private
          #
          # @param name_sym [Symbol]
          #
          # @param type_info [Hash{Symbol=>Object}, Proc, Pangea::Internal::Type::Converter, Class]
          #
          # @param spec [Hash{Symbol=>Object}] .
          #
          #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
          #
          #   @option spec [Proc] :enum
          #
          #   @option spec [Proc] :union
          #
          #   @option spec [Boolean] :"nil?"
          def required(name_sym, type_info, spec = {})
            add_field(name_sym, required: true, type_info: type_info, spec: spec)
          end

          # @api private
          #
          # @param name_sym [Symbol]
          #
          # @param type_info [Hash{Symbol=>Object}, Proc, Pangea::Internal::Type::Converter, Class]
          #
          # @param spec [Hash{Symbol=>Object}] .
          #
          #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
          #
          #   @option spec [Proc] :enum
          #
          #   @option spec [Proc] :union
          #
          #   @option spec [Boolean] :"nil?"
          def optional(name_sym, type_info, spec = {})
            add_field(name_sym, required: false, type_info: type_info, spec: spec)
          end

          # @api private
          #
          # @param name_sym [Symbol]
          #
          # @param required [Boolean]
          #
          # @param type_info [Hash{Symbol=>Object}, Proc, Pangea::Internal::Type::Converter, Class]
          #
          # @param spec [Hash{Symbol=>Object}] .
          #
          #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
          #
          #   @option spec [Proc] :enum
          #
          #   @option spec [Proc] :union
          #
          #   @option spec [Boolean] :"nil?"
          private def add_field(name_sym, required:, type_info:, spec:)
            type_fn, info =
              case type_info
              in Proc | Pangea::Internal::Type::Converter | Class
                [Pangea::Internal::Type::Converter.type_info({**spec, union: type_info}), spec]
              in Hash
                [Pangea::Internal::Type::Converter.type_info(type_info), type_info]
              end

            setter = "#{name_sym}="
            api_name = info.fetch(:api_name, name_sym)
            nilable = info.fetch(:nil?, false)
            const = required && !nilable ? info.fetch(:const, Pangea::Internal::OMIT) : Pangea::Internal::OMIT

            [name_sym, setter].each { undef_method(_1) } if known_fields.key?(name_sym)

            known_fields[name_sym] =
              {
                mode: @mode,
                api_name: api_name,
                required: required,
                nilable: nilable,
                const: const,
                type_fn: type_fn
              }

            define_method(setter) { @data.store(name_sym, _1) }

            define_method(name_sym) do
              target = type_fn.call
              value = @data.fetch(name_sym) { const == Pangea::Internal::OMIT ? nil : const }
              state = {strictness: :strong, exactness: {yes: 0, no: 0, maybe: 0}, branched: 0}
              if (nilable || !required) && value.nil?
                nil
              else
                Pangea::Internal::Type::Converter.coerce(
                  target,
                  value,
                  state: state
                )
              end
            rescue StandardError => e
              cls = self.class.name.split("::").last
              message = [
                "Failed to parse #{cls}.#{__method__} from #{value.class} to #{target.inspect}.",
                "To get the unparsed API response, use #{cls}[#{__method__.inspect}].",
                "Cause: #{e.message}"
              ].join(" ")
              raise Pangea::Errors::ConversionError.new(message)
            end
          end
        end

        # Create a new instance of a model.
        #
        # @param data [Hash{Symbol=>Object}, Pangea::Internal::Type::BaseModel]
        def initialize(data = {})
          case Pangea::Internal::Util.coerce_hash(data)
          in Hash => coerced
            @data = coerced
          else
            message = "Expected a #{Hash} or #{Pangea::Internal::Type::BaseModel}, got #{data.inspect}"
            raise ArgumentError.new(message)
          end
        end

        # @api private
        #
        # @return [String]
        def inspect = "#<#{self.class}:0x#{object_id.to_s(16)} #{self}>"
      end
    end
  end
end

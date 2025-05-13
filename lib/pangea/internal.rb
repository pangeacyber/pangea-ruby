# frozen_string_literal: true

module Pangea
  # @api private
  module Internal
    OMIT =
      Object.new.tap do
        _1.define_singleton_method(:inspect) { "#<#{Pangea::Internal}::OMIT>" }
      end
        .freeze
  end
end

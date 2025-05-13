# typed: strong

module Pangea
  module Internal
    OMIT = T.let(Object.new.freeze, T.anything)
  end
end

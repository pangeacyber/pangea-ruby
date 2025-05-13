# frozen_string_literal: true

require "minitest/autorun"
require "minitest/focus"
require "minitest/hooks/test"
require "minitest/proveit"
require "minitest/rg"

require_relative "../../lib/pangea"
require_relative "service_namespaces"

class Minitest::Test
  include Minitest::Hooks

  make_my_diffs_pretty!
  parallelize_me!
  prove_it!
end

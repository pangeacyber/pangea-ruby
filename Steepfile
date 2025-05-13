# frozen_string_literal: true

require "yaml"

target :lib do
  configure_code_diagnostics(Steep::Diagnostic::Ruby.strict)

  signature("sig")

  YAML.safe_load_file("./manifest.yaml", symbolize_names: true) => { dependencies: }

  stdlibs = dependencies - %w[English net/http rbconfig set]

  stdlibs.each { library(_1) }
end

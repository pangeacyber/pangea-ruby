# frozen_string_literal: true

require_relative "lib/pangea/version"

Gem::Specification.new do |s|
  s.name = "pangea-sdk"
  s.version = Pangea::VERSION
  s.summary = "Ruby library to access the Pangea API"
  s.authors = ["Pangea"]
  s.email = "support@pangea.cloud"
  s.homepage = "https://gemdocs.org/gems/pangea-sdk"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/pangeacyber/pangea-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">=3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "connection_pool", "~> 2.5", ">= 2.5.3"
end

# frozen_string_literal: true

require "pathname"

require "minitest/test_task"

tapioca = "sorbet/tapioca"
ignore_file = ".ignore"

file(tapioca) do
  sh(*%w[tapioca init])
end

desc("Build Ruby gem")
multitask(:"build:gem") do
  Pathname(ignore_file).write(<<~GLOB)
    rbi/*
    sig/*
  GLOB

  sh(*%w[gem build -- pangea.gemspec])
  rm_rf(ignore_file)
end

desc("Typecheck `*.rbs`")
multitask(:"typecheck:steep") do
  sh(*%w[steep check])
end

desc("Typecheck `*.rbi`")
multitask(:"typecheck:sorbet") do
  sh(*%w[srb typecheck])
end

desc("Typecheck everything")
multitask(typecheck: [:"typecheck:steep", :"typecheck:sorbet"])

desc("Run test suites; use `TEST=path/to/test.rb` to run a specific test file")
multitask(:test) do
  rb =
    FileList[ENV.fetch("TEST", "./test/**/*_test.rb")]
    .map { "require_relative(#{_1.dump});" }
    .join

  ruby(*%w[-w -e], rb, verbose: false) { fail unless _1 }
end

xargs = %w[xargs --no-run-if-empty --null --max-procs=0 --max-args=300 --]

desc("Lint `*.rb(i)`")
multitask(:"lint:rubocop") do
  find = %w[find ./lib ./test ./rbi -type f -and ( -name *.rb -or -name *.rbi ) -print0]

  rubocop = %w[rubocop --fail-level E]
  rubocop += %w[--format github] if ENV.key?("CI")
  rubocop += %w[--except Lint/RedundantCopDisableDirective,Layout/LineLength]

  lint = xargs + rubocop
  sh("#{find.shelljoin} | #{lint.shelljoin}")
end

desc("Lint and typecheck")
multitask(lint: [:"lint:rubocop", :typecheck])

desc("Build yard docs")
multitask(:"build:docs") do
  sh(*%w[yard])
end

desc("Preview docs; use `PORT=<PORT>` to change the port")
multitask(:"docs:preview") do
  sh(*%w[yard server --reload --quiet --bind [::] --port], ENV.fetch("PORT", "8808"))
end

multitask(:default) do
  sh(*%w[rake --tasks])
end

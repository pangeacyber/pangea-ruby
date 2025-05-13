# frozen_string_literal: true

require_relative "../test_helper"

class Pangea::Test::Services::AiGuardTest < Minitest::Test
  def test_initialize
    pangea = Pangea::Services::AiGuard.new(api_token: "my-pangea-api-key")
    assert_equal Pangea::Internal::Util.parse_uri("https://ai-guard.aws.us.pangea.cloud"), pangea.instance_variable_get(:@client).instance_variable_get(:@base_url)

    pangea = Pangea::Services::AiGuard.new(api_token: "my-pangea-api-key", base_url: "http://localhost:4010")
    assert_equal Pangea::Internal::Util.parse_uri("http://localhost:4010"), pangea.instance_variable_get(:@client).instance_variable_get(:@base_url)

    pangea = Pangea::Services::AiGuard.new(api_token: "my-pangea-api-key", domain: "subdomain.example.org")
    assert_equal Pangea::Internal::Util.parse_uri("https://ai-guard.subdomain.example.org"), pangea.instance_variable_get(:@client).instance_variable_get(:@base_url)
  end

  def test_guard_text
    pangea = Pangea::Services::AiGuard.new(
      api_token: "my-pangea-api-key",
      base_url: "http://localhost:4010"
    )

    response = pangea.guard_text(
      text: "hello world",
      recipe: "pangea_prompt_guard",
      debug: true
    )

    assert_pattern do
      response => Pangea::Models::PangeaResponse
    end

    assert_pattern do
      response.result => Pangea::Models::AiGuard::TextGuardResult
    end
  end
end

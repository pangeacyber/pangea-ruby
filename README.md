# Pangea Ruby SDK

Ruby SDK for [Pangea](https://pangea.cloud/). Currently only supports
[AI Guard](https://pangea.cloud/services/ai-guard/).

## Installation

```
gem install pangea-sdk
```

## Usage

```ruby
require "pangea-sdk"

pangea = Pangea::Services::AiGuard.new(api_token: "my_pangea_api_token")

response = pangea.guard_text(
  text: "hello world",
  recipe: "pangea_prompt_guard",
  debug: true
)
```

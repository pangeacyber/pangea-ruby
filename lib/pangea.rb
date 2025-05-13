# frozen_string_literal: true

require "cgi"
require "date"
require "json"
require "net/http"
require "time"

require "connection_pool"

require_relative "pangea/errors"
require_relative "pangea/version"

require_relative "pangea/internal/util"

require_relative "pangea/internal/transport/pooled_net_requester"
require_relative "pangea/internal/transport/base_client"

require_relative "pangea/internal/type/converter"
require_relative "pangea/internal/type/array_of"
require_relative "pangea/internal/type/hash_of"
require_relative "pangea/internal/type/base_model"
require_relative "pangea/internal/type/boolean"
require_relative "pangea/internal/type/request_parameters"
require_relative "pangea/internal/type/union"
require_relative "pangea/internal/type/unknown"

require_relative "pangea/internal"
require_relative "pangea/client"
require_relative "pangea/request_options"

require_relative "pangea/models/pangea_response"
require_relative "pangea/models/ai_guard/classification_result"
require_relative "pangea/models/ai_guard/hardening_result"
require_relative "pangea/models/ai_guard/language_result"
require_relative "pangea/models/ai_guard/malicious_entity_result"
require_relative "pangea/models/ai_guard/prompt_injection_result"
require_relative "pangea/models/ai_guard/redact_entity_result"
require_relative "pangea/models/ai_guard/single_entity_result"
require_relative "pangea/models/ai_guard/topic_result"
require_relative "pangea/models/ai_guard/text_guard_message_param"
require_relative "pangea/models/ai_guard/text_guard_params"
require_relative "pangea/models/ai_guard/text_guard_result"

require_relative "pangea/services/ai_guard"

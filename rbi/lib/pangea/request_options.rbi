# typed: strong

module Pangea
  class RequestOptions < Pangea::Internal::Type::BaseModel
    # Maximum number of retries to attempt after a failed initial request.
    sig { returns(T.nilable(Integer)) }
    attr_accessor :max_retries

    # Request timeout in seconds.
    sig { returns(T.nilable(Float)) }
    attr_accessor :timeout

    # Returns a new instance of RequestOptions.
    sig { params(values: T::Hash[Symbol, T.anything]).returns(T.attached_class) }
    def self.new(values = {}); end
  end
end

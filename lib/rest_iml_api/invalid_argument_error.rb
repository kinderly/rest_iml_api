module RestImlApi
  class InvalidArgumentError < ::StandardError
    attr_reader :key

    def initialize(key)
      @key = key
    end
  end
end

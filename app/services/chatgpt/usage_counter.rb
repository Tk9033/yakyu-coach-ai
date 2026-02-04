module Chatgpt
  class UsageCounter
    def initialize(key:)
      @key = key
    end

    # 現在の使用回数を取得
    def count
      redis.get(@key).to_i
    end

    # 使用回数を +1 する
    def increment
      redis.incr(@key)
      redis.expire(@key, 24.hours.to_i)
    end

    private

    def redis
      Redis.current
    end
  end
end
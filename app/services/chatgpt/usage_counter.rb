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
      new_count = redis.incr(@key)

      # 初回（値が1になった時）だけ、24時間の有効期限を設定する

      return unless new_count == 1

      redis.expire(@key, 24.hours.to_i)
    end

    private

    def redis
      REDIS
    end
  end
end
module Chatgpt
  class UsageLimiter
    Result = Struct.new(:allowed?, :current, :limit)

    def initialize(key:, signed_in:)
      @key = key
      @signed_in = signed_in
      @counter = Chatgpt::UsageCounter.new(key: key)
    end

    def check_and_increment
      limit = daily_limit
      current = @counter.count

      # すでに上限に達している場合はNG
      return Result.new(false, current, limit) if current >= limit

      # OKならカウントを進める
      @counter.increment
      Result.new(true, current + 1, limit)
    end

    private

    def daily_limit
      if @signed_in
        Chatgpt::UsageLimit::USER_DAILY_LIMIT
      else
        Chatgpt::UsageLimit::GUEST_DAILY_LIMIT
      end
    end
  end
end
module Ai
  class SearchService
    def initialize(term:, level:)
      @term = term
      @level = level
    end

    def call
      normalized_term = normalize(@term)

      AiResult.find_by(
        term: normalized_term,
        level: @level
      )
    end

    private

    def normalize(term)
      term.strip.downcase
    end
  end
end
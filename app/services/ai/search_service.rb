module Ai
  class SearchService
    def initialize(term:, level:)
      @term = term
      @level = level
    end

    def call
      normalized_term = normalize(@term)

      cached_result = AiResult.find_by(
        term: normalized_term,
        level: @level
      )
      return cached_result if cached_result

      ai_response = call_openai(normalized_term)

      AiResult.create!(
        term: normalized_term,
        level: @level,
        description: ai_response[:description],
        related_terms: ai_response[:related_terms]
      )
    end

    private

    def normalize(term)
      term.strip.downcase
    end

    def call_openai(term)
      prompt = Ai::PromptBuilder.build(
          word: term,
          level: @level
      )

      response = Ai::OpenaiClient.call(prompt)

      {
          description: response[:description],
          related_terms: response[:related_terms]
      }
    end
  end
end
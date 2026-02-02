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
      prompt = Ai::PromptBuilder.build(word: term, level: @level)
      raw = Ai::OpenaiClient.call(prompt)

      description = raw[:description]
      related_terms = []

      # description の末尾に JSON が混ざっている場合を分離
      if description.is_a?(String) && description.include?('"related_terms"')
        json_part = description.match(/\{[\s\S]*\}\s*\z/)&.to_s
        text_part = description.sub(json_part.to_s, "").strip

        begin
          parsed = JSON.parse(json_part)
          related_terms = Array(parsed["related_terms"])
          description = text_part
        rescue JSON::ParserError
        end
      end

      {
        description: description,
        related_terms: related_terms
      }
    end
  end
end
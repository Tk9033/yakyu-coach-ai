module Ai
  class OpenaiClient
    def self.call(prompt)
      client = OpenAI::Client.new

      response = client.chat(
        parameters: {
          model: "gpt-4o-mini",
          messages: [
            {
              role: "system",
              content: Ai::SystemPrompt::BASEBALL_TERM_GUARD
            },
            {
              role: "user",
              content: prompt
            }
          ],
          temperature: 0.7
        }
      )

      parse_response(response)
    end

    def self.parse_response(response)
      content = response.dig("choices", 0, "message", "content")

      {
        description: content,
        related_terms: []
      }
    end

    private_class_method :parse_response
  end
end
class TermsController < ApplicationController
  def index
  end

  def search
    query = params[:query]

    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [
          { role: "system", content: "野球用語を初心者〜上級者向けに説明するアシスタントです。" },
          { role: "user", content: "#{query} をわかりやすく説明して" }
        ]
      }
    )

    ai_text = response.dig("choices", 0, "message", "content")

    # View に渡す形に整える（MVP では単純に text を渡せばOK）
    @result = {
      title: query,
      description: ai_text,
      supplement: nil
    }

    render :index
  end
end

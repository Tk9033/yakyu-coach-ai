class TermsController < ApplicationController
  def index
  end

  def search
    query = params[:query].to_s.strip
    level = session[:level] || params[:level] || "beginner"

    # ガード処理
    level = "beginner" unless Ai::LevelDefinition.valid?(level)
    session[:level] = level

    # 空検索ガード
    if query.blank?
      flash.now[:alert] = "検索する用語を入力してください"
      return render :index
    end

    # プロンプト生成
    prompt = Ai::PromptBuilder.build(
      word: query,
      level: level
    )

    client = OpenAI::Client.new

    begin
      response = client.chat(
        parameters: {
          model: "gpt-4o-mini",
          messages: [
            { role: "system", content: "あなたは野球用語を解説するアシスタントです。" },
            { role: "user", content: prompt }
          ]
        }
      )

      ai_text = response.dig("choices", 0, "message", "content")

      @result = {
        title: query,
        level: level,
        description: ai_text
      }

    rescue OpenAI::Error => e
      Rails.logger.error("OpenAI API error: #{e.message}")
      @error_message = "AIとの通信中にエラーが発生しました。しばらくしてから再度お試しください。"

    rescue StandardError => e
      Rails.logger.error("Unexpected error: #{e.message}")
      @error_message = "予期せぬエラーが発生しました。"
    end

    render :index
  end
end
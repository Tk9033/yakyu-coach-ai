class TermsController < ApplicationController
  def index
  end

  def search
    query = params[:query].to_s.strip
    level = session[:level] || params[:level] || "beginner"

    # ガード処理
    level = "beginner" unless Ai::LevelDefinition.valid?(level)
    session[:level] = level

    # 空検索の処理
    if query.blank?
      flash.now[:alert] = t("terms.flash.blank")
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
            { role: "system", content: Ai::SystemPrompt::BASEBALL_TERM_GUARD },
            { role: "user", content: prompt }
          ]
        }
      )

      ai_text = response.dig("choices", 0, "message", "content")

      body, json_part = ai_text.to_s.split("---", 2)

      description = body.strip
      related_terms = []

      if json_part.present?
        begin
          parsed = JSON.parse(json_part)
          terms = parsed["related_terms"]
          related_terms = terms.is_a?(Array) ? terms : []
        rescue JSON::ParserError => e
          Rails.logger.warn(
            "[RelatedTerms Parse Error] message=#{e.message}"
          )
        end
      end

      @result = {
        title: query,
        level: level,
        description: ai_text
      }
    rescue OpenAI::Error => e
      Rails.logger.error(
        "[OpenAI Error] type=#{e.class} message=#{e.message}"
      )
      @error_message = t("terms.error.openai")
    rescue StandardError => e
      Rails.logger.error(
        "[Unexpected Error] type=#{e.class} message=#{e.message}"
      )
      @error_message = t("terms.error.unexpected")
    end

    render :index
  end
end
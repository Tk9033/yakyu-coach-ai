class LevelsController < ApplicationController
  def new
    @mode = :new
  end

  def edit
    @mode = :edit
    render :new
  end

  def update
    level = params[:level]

    unless Ai::LevelDefinition.valid?(level)
      level = "beginner"
    end

    previous_level = session[:level]
    session[:level] = level

    labels = {
      "beginner" => "初心者",
      "intermediate" => "中級者",
      "advanced" => "上級者"
    }

    flash[:notice] =
      if previous_level.nil?
        "理解度を「#{labels[level]}」に設定しました"
      else
        "理解度を「#{labels[level]}」に変更しました"
      end
    redirect_to edit_level_path
  end
end
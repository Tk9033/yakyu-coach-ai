class LevelsController < ApplicationController
  def new
    @mode = :new
    @levels = Ai::LevelUiDefinition.all
  end

  def edit
    @mode = :edit
    @levels = Ai::LevelUiDefinition.all
    render :new
  end

  def update
    level = params[:level]

    level = "beginner" unless Ai::LevelDefinition.valid?(level)

    previous_level = session[:level]
    session[:level] = level

    label = Ai::LevelDefinition.label(level)

    flash[:notice] =
      if previous_level.nil?
        "理解度を「#{label}」に設定しました"
      else
        "理解度を「#{label}」に変更しました"
      end

    redirect_to edit_level_path
  end
end
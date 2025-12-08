class LevelsController < ApplicationController
  def new
    @mode = :new
  end

  def edit
    @mode = :edit
    render :new
  end
end
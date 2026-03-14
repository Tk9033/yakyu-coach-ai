class AiResultsController < ApplicationController
  def show
    @result = AiResult.find(params[:id])
  end
end
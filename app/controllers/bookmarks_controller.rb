class BookmarksController < ApplicationController
  # ログイン
  before_action :authenticate_user!

  # ブックマーク表示
  def index
    @bookmarks = current_user.bookmarks.includes(:ai_result).order(created_at: :desc)
  end

  # ブックマーク 登録
  def create
    @ai_result = AiResult.find(params[:ai_result_id])
    current_user.bookmarks.create(ai_result: @ai_result)

    flash.now[:notice] = "ブックマークしました"

    respond_to do |format|
      format.html { redirect_back_or_to(root_path) }
      format.turbo_stream # create.turbo_stream.erb を探しにいく
    end
  end

  # ブックマーク削除
  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    @ai_result = bookmark.ai_result
    bookmark.destroy

    flash.now[:alert] = "ブックマークを解除しました"

    respond_to do |format|
      format.html { redirect_back_or_to(root_path) }
      format.turbo_stream # destroy.turbo_stream.erb を探しにいく
    end
  end
end

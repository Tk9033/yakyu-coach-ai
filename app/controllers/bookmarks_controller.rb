class BookmarksController < ApplicationController
  # ログイン
  before_action :authenticate_user!

  # ブックマーク
  def create
    @ai_result = AiResult.find(params[:ai_result_id])
    current_user.bookmarks.create(ai_result: @ai_result)

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.turbo_stream # create.turbo_stream.erb を探しにいく
    end
  end

  # ブックマーク削除
  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    @ai_result = bookmark.ai_result
    bookmark.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.turbo_stream # destroy.turbo_stream.erb を探しにいく
    end
  end
end

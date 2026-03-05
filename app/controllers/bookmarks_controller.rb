class BookmarksController < ApplicationController
  # ログイン
  before_action :authenticate_user!

  # ブックマーク
  def create
    bookmark = current_user.bookmarks.create(ai_result_id: params[:ai_result_id])
    redirect_back fallback_location: root_path
  end

  # ブックマーク削除
  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    bookmark.destroy
    redirect_back fallback_location: root_path
  end
end

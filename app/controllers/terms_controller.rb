class TermsController < ApplicationController
  def index
  end

  def search
    puts "★ search アクションが動きました"
    query = params[:query]

    # ★ ダミーの検索結果（AIなしで表示テスト用）
    @result = {
      title: "ストライクとは？",
      description: "ストライクは、打者に対する有効な投球を指します。",
      supplement: "初心者向け：ストライクは3つでアウトになります。"
    }

    render :index
  end
end

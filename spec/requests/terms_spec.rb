require "rails_helper"

RSpec.describe "Terms", type: :request do
  describe "GET /terms/search" do
    it "検索ワードが空の場合エラーになる" do
      get search_terms_path, params: { q: "" }

      expect(response.body).to include("検索する用語を入力してください")
    end
  end
end
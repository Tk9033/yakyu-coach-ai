require "rails_helper"

# ユーザー動線

RSpec.describe "検索機能", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "検索フォームから用語を入力して送信できる" do
    visit terms_path

    fill_in "search-input", with: "スライダー"
    find("button[type='submit']").click

    expect(page).to have_current_path(
      search_terms_path,
      ignore_query: true
    )
  end
end
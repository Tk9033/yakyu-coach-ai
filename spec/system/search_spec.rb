require "rails_helper"

RSpec.describe "検索機能", type: :system do
  before do
    driven_by(:rack_test)

    allow(Ai::OpenaiClient).to receive(:call).and_return(
      {
        description: <<~TEXT
          これは解説です
          {"related_terms":["カーブ","ストレート"]}
        TEXT
      }
    )
  end

  it "用語を検索すると解説が表示される" do
    visit terms_path

    fill_in "search-input", with: "スライダー"
    find("button[type='submit']").click

    expect(page).to have_content("これは解説です")
  end
end
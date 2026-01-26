require "rails_helper"

RSpec.describe "理解度選択", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "初心者に理解度を変更できる" do
    visit root_path
    click_link "理解度変更"
    within('[data-level="beginner"]') do
      find("button.decide-button").click
    end
    expect(page).to have_content("理解度を「初心者」に設定しました")
    expect(page).to have_link("検索画面へ進む")
  end
end
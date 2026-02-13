require "rails_helper"

RSpec.describe "ユーザー認可（Googleログイン）", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "未ログイン時" do
    it "トップページにGoogleでログインボタンが表示されている" do
      visit root_path

      expect(page).to have_link("Googleでログイン")
    end
  end

  context "Googleログイン" do
    it "Googleアカウントでログインできる" do
      visit root_path

      click_link "Googleでログイン"

      expect(page).to have_content("Googleアカウントでログインしました")
      expect(page).to have_button("ログアウト")
    end
  end

  context "ログアウト" do
    it "ログアウトできる" do
      visit root_path
      click_link "Googleでログイン"

      click_button "ログアウト"

      expect(page).to have_content("ログアウトしました")
      expect(page).to have_link("Googleでログイン")
    end
  end

  context "Googleログイン失敗時" do
    before do
      OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    end

    after do
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuthMock.google_success
    end

    it "ログインできず、エラーメッセージが表示される" do
      visit root_path
      click_link "Googleでログイン"

      expect(page).to have_content("Googleログインに失敗しました")
      expect(page).to have_link("Googleでログイン")
      expect(page).not_to have_button("ログアウト")
    end
  end
end
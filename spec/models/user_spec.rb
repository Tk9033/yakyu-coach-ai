require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    context "when provider と uid がある場合" do
      it "有効である" do
        expect(build(:user)).to be_valid
      end
    end

    context "when provider と uid が両方ない場合（ゲスト）" do
      it "有効である" do
        expect(build(:user, provider: nil, uid: nil)).to be_valid
      end
    end

    context "when provider と uid の組み合わせが重複する場合" do
      it "無効である" do
        create(:user, provider: "google_oauth2", uid: "dup_uid")
        user = build(:user, provider: "google_oauth2", uid: "dup_uid")

        expect(user).not_to be_valid
      end
    end

  end
end
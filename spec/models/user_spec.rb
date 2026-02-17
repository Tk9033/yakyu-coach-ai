require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    context "when provider と uid がある場合" do
      it "有効である" do
        expect(build(:user)).to be_valid
      end
    end

    context "when provider がない場合" do
      it "無効である" do
        expect(build(:user, provider: nil)).not_to be_valid
      end
    end

    context "when uid がない場合" do
      it "無効である" do
        expect(build(:user, uid: nil)).not_to be_valid
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
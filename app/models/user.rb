class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_ai_results, through: :bookmarks, source: :ai_result

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  GUEST_EMAIL = "guest@example.com".freeze

  def guest?
    email == GUEST_EMAIL
  end

  def omniauth_user?
    provider.present? && uid.present?
  end

  validates :provider, presence: true, if: :omniauth_user?
  validates :uid, presence: true, if: :omniauth_user?
  validates :uid, uniqueness: { scope: :provider }, if: :omniauth_user?
end

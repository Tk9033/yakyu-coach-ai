OmniAuth.config.test_mode = true

module OmniAuthMock
  def self.google_success
    OmniAuth::AuthHash.new(
      provider: "google_oauth2",
      uid: "123456789",
      info: {
        email: "test@example.com",
        name: "Test User"
      }
    )
  end
end

# デフォルトは成功状態にしておく
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuthMock.google_success
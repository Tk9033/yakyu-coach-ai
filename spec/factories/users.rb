FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password123" }

    provider { "google_oauth2" }
    sequence(:uid) { |n| "uid_#{n}" }
  end
end
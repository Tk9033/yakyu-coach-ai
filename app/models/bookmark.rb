class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :ai_result

  validates :user_id, uniqueness: { scope: :ai_result_id }
end

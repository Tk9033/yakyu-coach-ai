class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :ai_result
end

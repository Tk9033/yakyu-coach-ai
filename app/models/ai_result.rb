class AiResult < ApplicationRecord
  validates :term, presence: true
  validates :level, presence: true
  validates :description, presence: true
end

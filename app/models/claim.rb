class Claim < ApplicationRecord
  belongs_to :task
  validates :troubled_at, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :support_content, presence: true
end

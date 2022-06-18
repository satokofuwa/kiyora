class Claim < ApplicationRecord
  belongs_to :task
  validates :troubled_at, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :support_content, presence: true
  enum category: { "要対応": 1, "様子見": 2, "緊急対応":3, "申し送り":4}
end

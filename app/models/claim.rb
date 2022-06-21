class Claim < ApplicationRecord
  belongs_to :task
  validates :troubled_at, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :support_content, presence: true
  validate  :day_check
  def day_check
    unless troubled_at == nil
      errors.add(:troubled_at, 'は今日を含む過去の日付を入力して下さい') if troubled_at > Date.today
    end
  end

  enum category: { "要対応": 1, "様子見": 2, "緊急対応":3, "申し送り":4}
end

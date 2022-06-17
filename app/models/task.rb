class Task < ApplicationRecord
  validates :name, presence: true
  validates :dispatch, presence: true
  validates :category, presence: true
  validates :support_at, presence: true
  validates :confirmation, presence: true
  validates :step, presence: true
  validates :vehicle, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :sales_check, presence: true
  validates :admin_check, presence: true
  validates :sales, presence: true
end

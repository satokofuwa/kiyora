class Partner < ApplicationRecord
  has_many :task_partners, dependent: :destroy
  has_many :tasks, through: :task_partners, source: :task
  with_options presence: true do
    validates :name
  end
end

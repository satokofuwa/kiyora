class Worker < ApplicationRecord
  has_many :task_workers, dependent: :destroy
  has_many :tasks, through: :task_workers, source: :task
end

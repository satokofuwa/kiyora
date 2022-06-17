class TaskWorker < ApplicationRecord
  belongs_to :task
  belongs_to :worker
end

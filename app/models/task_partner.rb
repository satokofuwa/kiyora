class TaskPartner < ApplicationRecord
  belongs_to :task
  belongs_to :partner
end

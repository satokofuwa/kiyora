class CreateTaskPartners < ActiveRecord::Migration[6.0]
  def change
    create_table :task_partners, id: :bigint do |t|
    t.references	:task , null: false, foreign_key: true
    t.references	:partner , null: false, foreign_key: true
    t.datetime	:created_at , null: false
    end
  end
end

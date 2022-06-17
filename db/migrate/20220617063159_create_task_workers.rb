class CreateTaskWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :task_workers, id: :bigint do |t|
      t.references	:task , null: false, foreign_key: true
      t.references	:worker , null: false, foreign_key: true
      t.datetime	:created_at
    end
  end
end

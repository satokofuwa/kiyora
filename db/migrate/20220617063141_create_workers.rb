class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers, id: :bigint do |t|
      t.string	:name, limit: 100, null: false
      t.datetime	:created_at, null: false
      t.datetime	:updated_at, null: false
    end
  end
end

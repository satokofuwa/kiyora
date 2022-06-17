class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :bigint do |t|
      t.references	:task,foreign_key: true
      t.string	:name
      t.boolean :admin, default: false
      t.datetime	:created_at, null: false
      t.datetime	:updated_at, null: false
    end
  end
end

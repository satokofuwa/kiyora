class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties, id: :bigint do |t|
      t.references	:task , null: false, foreign_key: true
      t.string	:name, null: false
      t.string	:zip, null: false
      t.string	:prefecture, null: false
      t.string	:city, null: false
      t.string	:address, null: false
      t.string	:tel, null: false
      t.datetime	:created_at, null: false
      t.datetime	:updated_at, null: false
    end
  end
end
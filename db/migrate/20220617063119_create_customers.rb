class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers, id: :serial , limit: 6 do |t|
      t.references	:task , null: false, foreign_key: true
      t.string	:name,  limit: 255
      t.string	:zip, null: false
      t.string	:address, null: false
      t.string	:tel, null: false
      t.integer	:room_number
      t.datetime	:created_at, null: false
      t.datetime	:updated_at, null: false
    end
  end
end
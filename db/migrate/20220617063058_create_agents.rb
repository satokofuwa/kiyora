class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents, id: :bigint do |t|
      t.references	:task , null: false, foreign_key: true
      t.string	:name, null: false
      t.string	:zip, null: false, limit: 7 
      t.string	:prefecture, null: false,  limit: 8
      t.string	:city, null: false,  limit: 24
      t.string	:address, null: false,  limit: 255
      t.string	:tel
      t.string	:manager_name
      t.datetime	:created_at
      t.datetime	:updated_at
    end
  end
end

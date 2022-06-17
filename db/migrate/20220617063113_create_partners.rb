class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners, id: :bigint do |t|
    t.string	:name, null: false
    t.string	:sales, default: 0
    t.string	:worker
    t.string	:contact, null: false
    t.datetime	:created_at, null: false
    t.datetime	:updated_at, null: false
    end
  end
end

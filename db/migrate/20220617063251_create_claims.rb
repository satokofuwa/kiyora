class CreateClaims < ActiveRecord::Migration[6.0]
  def change
    create_table :claims, id: :bigint do |t|
      t.references	:task , null: false, foreign_key: true
      t.datetime	:troubled_at, null: false
      t.integer	:category, null: false,  limit: 2
      t.text	:content, null: false,  limit: 255
      t.text	:support_content, null: false,  limit: 255
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end


class CreateFrontManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :front_managers, id: :bigint do |t|
      t.references	:task , null: false, foreign_key: true
      t.integer	:manager
      t.string	:tel
      t.string	:support_at
      t.string	:office_hours
      t.text	:content
      t.datetime	:created_at, null: false
      t.datetime	:updated_at, null: false
    end
  end
end

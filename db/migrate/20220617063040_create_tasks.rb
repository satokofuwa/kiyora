class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks, id: :serial do |t|
      t.string	:name
      t.integer :dispatch
      t.text	:content
      t.datetime	:support_at
      t.datetime	:start_time
      t.datetime	:end_time
      t.integer	:category
      t.integer	:step
      t.integer	:sales_check
      t.integer	:admin_check
      t.string	:vehicle
      t.bigint	:sales
      t.integer	:confirmation
      t.bigint  :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
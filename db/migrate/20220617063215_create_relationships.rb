class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships, id: :bigint do |t|
      t.integer  :follower_id
      t.integer  :followed_id
      t.datetime :created_at, null: false
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id],unique: true
  end
end

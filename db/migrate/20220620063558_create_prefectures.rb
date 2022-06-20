class CreatePrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :prefectures do |t|
      t.integer :area, null: false, default: 0
      t.string  :kanji, null: false
      t.string  :romaji, null: false
    end
  end
end

class CreatePressKitEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :press_kit_entries do |t|
      t.string :title
      t.text :article_link
      t.text :article_image_url
      t.datetime :release_at
      t.belongs_to :press_kit, null: false, foreign_key: true
      t.date :published_on

      t.timestamps
    end
  end
end

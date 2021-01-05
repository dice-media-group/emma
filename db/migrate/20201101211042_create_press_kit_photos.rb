class CreatePressKitPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :press_kit_photos do |t|
      t.string :title
      t.string :byline
      t.text :description
      t.string :dimensions_wxh
      t.belongs_to :press_kit, null: false, foreign_key: true
      t.string :headshot_or_other
      t.text :link
      t.datetime :publish_at

      t.timestamps
    end
  end
end

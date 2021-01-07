class CreateBookInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :book_infos do |t|
      t.string :billboard_image_title
      t.text :billboard_image_url
      t.belongs_to :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end

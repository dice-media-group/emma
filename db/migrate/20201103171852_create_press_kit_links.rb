class CreatePressKitLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :press_kit_links do |t|
      t.string :text
      t.string :url
      t.string :category
      t.belongs_to :press_kit, null: false, foreign_key: true

      t.timestamps
    end
  end
end

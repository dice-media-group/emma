class CreateMerchandiseLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :merchandise_links do |t|
      t.string :seller_name
      t.text :url
      t.belongs_to :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end

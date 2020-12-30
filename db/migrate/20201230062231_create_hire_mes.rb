class CreateHireMes < ActiveRecord::Migration[6.0]
  def change
    create_table :hire_mes do |t|
      t.text :billboard_image_filename
      t.string :headline
      t.string :body
      t.belongs_to :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end

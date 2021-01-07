class AddBillboardImageTitleToPressKit < ActiveRecord::Migration[6.0]
  def change
    add_column :press_kits, :billboard_image_title, :string
  end
end

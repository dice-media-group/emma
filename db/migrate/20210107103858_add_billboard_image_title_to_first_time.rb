class AddBillboardImageTitleToFirstTime < ActiveRecord::Migration[6.0]
  def change
    add_column :first_times, :billboard_image_title, :string
  end
end

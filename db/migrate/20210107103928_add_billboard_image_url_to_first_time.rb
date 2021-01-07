class AddBillboardImageUrlToFirstTime < ActiveRecord::Migration[6.0]
  def change
    add_column :first_times, :billboard_image_url, :text
  end
end

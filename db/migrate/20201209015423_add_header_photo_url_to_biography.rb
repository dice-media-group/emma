class AddHeaderPhotoUrlToBiography < ActiveRecord::Migration[6.0]
  def change
    add_column :biographies, :header_photo_url, :text
  end
end

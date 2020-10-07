class CreateWallpapers < ActiveRecord::Migration[6.0]
  def change
    create_table :wallpapers do |t|
      t.string :title
      t.string :device_size

      t.timestamps
    end
  end
end

class AddDefaultMetaImageToGeneralInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :general_infos, :default_meta_image, :text
  end
end

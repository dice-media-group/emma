class AddDefaultMetaBlurbToGeneralInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :general_infos, :default_meta_blurb, :text
  end
end

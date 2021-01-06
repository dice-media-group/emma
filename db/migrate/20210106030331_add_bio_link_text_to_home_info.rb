class AddBioLinkTextToHomeInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :home_infos, :bio_link_text, :string
  end
end

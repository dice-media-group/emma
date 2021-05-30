class AddSeoDescriptionToBlogEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_entries, :seo_description, :text
  end
end

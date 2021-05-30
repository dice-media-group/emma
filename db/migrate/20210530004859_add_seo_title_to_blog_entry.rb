class AddSeoTitleToBlogEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_entries, :seo_title, :string
  end
end

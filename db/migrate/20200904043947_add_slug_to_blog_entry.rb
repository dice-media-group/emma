class AddSlugToBlogEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_entries, :slug, :string
    add_index :blog_entries, :slug, unique: true
  end
end

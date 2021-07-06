class RemoveEntryIdFromBlogArticle < ActiveRecord::Migration[6.0]
  def change
    remove_column :blog_articles, :entry_id, :integer
  end
end

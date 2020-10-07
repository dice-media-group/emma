class RemoveBlogEntryIdFromBlogArticle < ActiveRecord::Migration[6.0]
  def change
    remove_reference :blog_articles, :blog_entry, null: false, foreign_key: true
  end
end

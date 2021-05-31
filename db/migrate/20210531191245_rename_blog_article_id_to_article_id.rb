class RenameBlogArticleIdToArticleId < ActiveRecord::Migration[6.0]
  def change
    rename_column :blog_entries, :blog_article_id, :article_id
  end
end

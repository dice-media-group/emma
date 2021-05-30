class AddBlogArticleIdToBlogEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_entries, :blog_article_id, :integer
  end
end

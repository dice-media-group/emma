class RemoveBodyFromBlogArticle < ActiveRecord::Migration[6.0]
  def change
    remove_column :blog_articles, :body, :text
  end
end

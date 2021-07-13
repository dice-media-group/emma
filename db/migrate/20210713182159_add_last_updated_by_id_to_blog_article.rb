class AddLastUpdatedByIdToBlogArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_articles, :last_updated_by_id, :integer, default: 0

  end
end

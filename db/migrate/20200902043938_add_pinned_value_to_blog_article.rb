class AddPinnedValueToBlogArticle < ActiveRecord::Migration[6.0]
  def change
    # pinned_value: articles with pinned_value > 0 get top billing
    add_column :blog_articles, :pinned_value, :integer, default: 0

  end
end

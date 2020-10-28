class AddEntryReferenceToBlogArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :blog_articles, :entry, null: false, foreign_key: {to_table: 'blog_entries'}
  end
end

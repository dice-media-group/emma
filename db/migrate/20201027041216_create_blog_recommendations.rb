class CreateBlogRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_recommendations do |t|
      t.belongs_to :entry, null: false, foreign_key: {to_table: 'blog_entries'}
      t.string :description

      t.timestamps
    end
  end
end

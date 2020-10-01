class CreateBlogEntryAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_entry_assignments do |t|
      t.belongs_to :blog_entry, null: false, foreign_key: true
      t.belongs_to :blog_article, null: false, foreign_key: true

      t.timestamps
    end
  end
end

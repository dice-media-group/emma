class CreateBlogEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_entries do |t|
      t.string :title

      t.timestamps
    end
  end
end

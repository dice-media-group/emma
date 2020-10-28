class AddPublishAtToBlogEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_entries, :publish_at, :datetime
  end
end

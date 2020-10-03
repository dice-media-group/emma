class AddPinnedValueToBlogEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_entries, :pinned_value, :integer
  end
end

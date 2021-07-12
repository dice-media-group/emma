class AddNullAttrToEntryPinnedValue < ActiveRecord::Migration[6.0]
  def change
    change_column_null :blog_entries, :pinned_value, false
  end
end

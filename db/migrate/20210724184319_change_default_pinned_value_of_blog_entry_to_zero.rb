class ChangeDefaultPinnedValueOfBlogEntryToZero < ActiveRecord::Migration[6.1]
  change_column_null(
    :blog_entries,
    :pinned_value,
    false,
    0
  ) 

  change_column_default(
    :blog_entries,
    :pinned_value,
    0
  )

end

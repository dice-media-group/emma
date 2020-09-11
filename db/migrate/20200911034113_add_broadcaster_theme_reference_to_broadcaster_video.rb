class AddBroadcasterThemeReferenceToBroadcasterVideo < ActiveRecord::Migration[6.0]
  def change
    add_reference :broadcaster_videos, :broadcaster_theme, null: false, foreign_key: true
  end
end

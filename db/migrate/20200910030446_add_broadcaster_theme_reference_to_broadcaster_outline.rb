class AddBroadcasterThemeReferenceToBroadcasterOutline < ActiveRecord::Migration[6.0]
  def change
    add_reference :broadcaster_outlines, :broadcaster_theme, null: false, foreign_key: true
  end
end

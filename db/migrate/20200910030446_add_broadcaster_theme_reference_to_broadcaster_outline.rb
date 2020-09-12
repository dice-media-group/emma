class AddBroadcasterThemeReferenceToBroadcasterOutline < ActiveRecord::Migration[6.0]
  def change
    add_reference :broadcaster_outlines, :theme, null: false, foreign_key: true
  end
end

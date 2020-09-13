class CreateBroadcasterThemeAvatars < ActiveRecord::Migration[6.0]
  def change
    create_table :broadcaster_theme_avatars do |t|
      t.belongs_to :broadcaster_theme, null: false, foreign_key: true
      t.belongs_to :broadcaster_avatar, null: false, foreign_key: true

      t.timestamps
    end
  end
end

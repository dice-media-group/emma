class CreateBroadcasterThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :broadcaster_themes do |t|
      t.string :title

      t.timestamps
    end
  end
end

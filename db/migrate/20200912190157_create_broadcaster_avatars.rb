class CreateBroadcasterAvatars < ActiveRecord::Migration[6.0]
  def change
    create_table :broadcaster_avatars do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

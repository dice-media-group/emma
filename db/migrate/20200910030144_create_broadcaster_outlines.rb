class CreateBroadcasterOutlines < ActiveRecord::Migration[6.0]
  def change
    create_table :broadcaster_outlines do |t|
      t.text :body

      t.timestamps
    end
  end
end

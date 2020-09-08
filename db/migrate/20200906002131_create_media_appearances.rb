class CreateMediaAppearances < ActiveRecord::Migration[6.0]
  def change
    create_table :media_appearances do |t|
      t.string :title
      t.datetime :published_on

      t.timestamps
    end
  end
end

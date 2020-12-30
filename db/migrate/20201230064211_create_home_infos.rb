class CreateHomeInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :home_infos do |t|
      t.text :biography_blurb
      t.text :video_billboard_url
      t.text :watch_this_video_url
      t.belongs_to :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end

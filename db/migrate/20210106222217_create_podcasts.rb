class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.text :billboard_image_url
      t.string :headline
      t.string :title
      t.text :podcast_player_src

      t.timestamps
    end
  end
end

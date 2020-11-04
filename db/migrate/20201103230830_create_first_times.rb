class CreateFirstTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :first_times do |t|
      t.string :first_name
      t.string :last_name
      t.string :blurb
      t.string :twitter_handle
      t.text :featured_image_src
      t.text :featured_youtube_video_url

      t.timestamps
    end
  end
end

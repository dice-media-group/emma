class AddFeaturedYoutubeImageUrlToFirstTime < ActiveRecord::Migration[6.0]
  def change
    add_column :first_times, :featured_youtube_image_url, :text, null: false, default: ""
  end
end

class AddYoutubeImageUrlToGetInContactContent < ActiveRecord::Migration[6.0]
  def change
    add_column :get_in_contact_contents, :youtube_image_url, :text, null: false, default: ""
  end
end

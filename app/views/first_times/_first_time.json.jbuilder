json.extract! first_time, :id, :first_name, :last_name, :blurb, :twitter_handle, :featured_image_src, :featured_youtube_video_url, :created_at, :updated_at
json.url first_time_url(first_time, format: :json)

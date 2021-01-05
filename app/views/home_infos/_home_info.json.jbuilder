json.extract! home_info, :id, :biography_blurb, :video_billboard_url, :watch_this_video_url, :site_id, :created_at, :updated_at
json.url home_info_url(home_info, format: :json)

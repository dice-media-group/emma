json.extract! blog_card, :id, :blog_list_id, :name, :position, :created_at, :updated_at
json.url blog_card_url(blog_card, format: :json)

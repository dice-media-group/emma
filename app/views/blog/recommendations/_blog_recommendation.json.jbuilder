json.extract! blog_recommendation, :id, :entry_id, :description, :created_at, :updated_at
json.url blog_recommendation_url(blog_recommendation, format: :json)

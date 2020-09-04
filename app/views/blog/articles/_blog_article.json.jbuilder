json.extract! blog_article, :id, :title, :body, :user_id, :created_at, :updated_at
json.url blog_article_url(blog_article, format: :json)

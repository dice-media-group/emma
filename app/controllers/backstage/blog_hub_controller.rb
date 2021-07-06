class Backstage::BlogHubController < ApplicationController
  before_action :authenticate_user!
  def index
    @blog_articles = Blog::Article.all

    
  end
end

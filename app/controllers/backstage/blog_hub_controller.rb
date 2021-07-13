class Backstage::BlogHubController < ApplicationController
  before_action :authenticate_user!

  def index
    if(params.has_key?(:search)) 
      _search_blog_articles
    end

    # if params[:sort] == "pinned_order"
    #   @blog_articles = Blog::Article.joins(:entry).order('blog_entries.pinned_value DESC')
    # elsif params[:sort] != "pinned_order"
    #  @blog_articles = Blog::Article.order(params[:sort])
    # else
    #   @blog_articles = Blog::Article.all.order(created_at: :desc)
    # end

    if(params.has_key?(:sort)) 
      if params[:sort] == "pinned_value"
        @blog_articles = Blog::Article.joins(:entry).order('blog_entries.pinned_value DESC')
      elsif params[:sort] == "publish_at"
        @blog_articles = Blog::Article.joins(:entry).order('blog_entries.publish_at DESC')
      elsif params[:sort] == "user"
        @blog_articles = @blog_articles = Blog::Article.joins(:user).order('users.first_name ASC')
      elsif params[:sort] == "created_at"
        @blog_articles = Blog::Article.order('created_at DESC')
      else
          @blog_articles = Blog::Article.order(params[:sort])
      end
    else
      @blog_articles = Blog::Article.all.order(created_at: :desc)      
    end

  end
  
  def _search_blog_articles
    if @blog_article = Blog::Article.all.find{|blog_article| blog_article.title.include?(params[:search])}
      redirect_to edit_blog_article_path(@blog_article)
    end
  end


end


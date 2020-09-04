class HomeController < ApplicationController
  def index
    @articles = Blog::Article.where("pinned_value > ?", 0)
    render :layout => 'frontdoor'
  end

  def terms
        render :layout => 'frontdoor'

  end

  def privacy
    render :layout => 'frontdoor'
  end

  def first_time_here
    render :layout => 'frontdoor'
    
  end

  def hire_me
    render :layout => 'frontdoor'
    
  end

  def biography
    render :layout => 'frontdoor'
    
  end
end

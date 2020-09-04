class HomeController < ApplicationController
  def index
    @articles = Blog::Article.where("pinned_value > ?", 0)
    render :layout => 'frontdoor'
  end

  def terms
  end

  def privacy
  end

  def first_time_here
    
  end

  def hire_me
    
  end

  def biography
    
  end
end

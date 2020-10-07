class HomeController < ApplicationController
  def index
    @pinned_entries = Blog::Entry.all_pinned
    @coming_soon = Meetup.coming_soon
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

  def contact_me
    render :layout => 'frontdoor'    
  end

  def wallpapers
    render :layout => 'frontdoor'
    
  end
end

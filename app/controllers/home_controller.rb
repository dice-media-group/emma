class HomeController < ApplicationController
  layout "frontdoor"


  def index
    @site           = Site.first
    
    @pinned_entries = Blog::Entry.all_pinned
    @coming_soon    = Meetup.coming_soon
    @lead           = Lead.new
    @home_info      = @site.home_info
  end

  def terms

  end

  def privacy
  end

def first_time_here
    @site = Site.first
    @first_time = @site.first_time
  end

  def hire_me
    @lead     = Lead.new
    @site     = Site.first
    @hire_me  = @site.hire_me
    
  end

  def biography
    @site           = Site.first
    @biography      = @site.biography
  end

  def contact_me
  end

  def wallpapers
    
  end

end

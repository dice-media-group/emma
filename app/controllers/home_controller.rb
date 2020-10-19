class HomeController < ApplicationController
  layout "frontdoor"


  def index
    @pinned_entries = Blog::Entry.all_pinned
    @coming_soon    = Meetup.coming_soon
    @lead           = Lead.new
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

  def contact_me
  end

  def wallpapers
    
  end
end

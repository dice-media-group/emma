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
    
  end

  def hire_me
    @lead           = Lead.new
    
  end

  def biography
    @bio_hash   = { title:  "filler title",
                    body:   "Whoops! There's no entry for your story yet.  Please update your story in <a href='/admin/biographies/new'>admin</a>.".html_safe
                  }
    @biography  = Biography.last || OpenStruct.new(@bio_hash)
  end

  def contact_me
  end

  def wallpapers
    
  end

end

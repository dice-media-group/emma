class MeetupsController < ApplicationController
  layout "frontdoor"

  # GET /meetups
  # GET /meetups.json
  def index
    @site         = Site.first
    @meetup_info  = @site.meetup_info
    @meetups      = Meetup.all
  end

  # GET /meetups/1
  # GET /meetups/1.json
  def show
  end

end

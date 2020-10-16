class MeetupsController < ApplicationController

  # GET /meetups
  # GET /meetups.json
  def index
    @meetups = Meetup.all
    render :layout => 'frontdoor'
  end

  # GET /meetups/1
  # GET /meetups/1.json
  def show
  end

end

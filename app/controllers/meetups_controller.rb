class MeetupsController < ApplicationController
  layout "frontdoor"

  # GET /meetups
  # GET /meetups.json
  def index
    @meetups = Meetup.all
  end

  # GET /meetups/1
  # GET /meetups/1.json
  def show
  end

end

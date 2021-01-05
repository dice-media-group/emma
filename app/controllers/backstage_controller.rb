class BackstageController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Meetup.first(3)
    @leads  = []
    @agenda = []
    @tasks  = []
    @platforms  = []
    @comments   = []

  end
end

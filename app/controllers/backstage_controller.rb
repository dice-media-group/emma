class BackstageController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Meetup.first(3)
    @leads  = []
    @agenda = []
    @tasks  = []
    @platforms  = []
    @comments   = []

    @biography = Biography.last
    @book_info = BookInfo.last
    @onboarding   = Onboarding.new
    @onboarding_steps_completed_percentage = @onboarding.completed_steps_percentage


  end
end

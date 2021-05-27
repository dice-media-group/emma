class BackstageController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Meetup.first(3)
    @leads  = []
    @agenda = []
    @tasks  = []
    @platforms  = []
    @comments   = []

    # site settings
    @site = Site.first
    @biography                = @site.biography
    @book_info                = @site.book_info
    @home_info                = @site.home_info
    @first_time               = @site.first_time
    @get_in_contact_content   = @site.get_in_contact_content
    @meetup_info              = @site.meetup_info
    @podcast                  = @site.podcast
    @press_kit                  = @site.press_kit

    @publisher_accts = PublisherAcct.all
    @onboarding   = Onboarding.new
    @onboarding_completed_content_steps_percentage = @onboarding.completed_content_steps_percentage


  end
end

class Backstage::SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @site = Site.first
    @biography                = @site.biography
    @biography                = @site.book_info
    @home_info                = @site.home_info
    @first_time               = @site.first_time
    @get_in_contact_content   = @site.get_in_contact_content
    @meetup_info              = @site.meetup_info
    @podcast                  = @site.podcast
    @press_kit                  = @site.press_kit
  end
end

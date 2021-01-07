class Backstage::SettingsController < ApplicationController
  def index
    @site = Site.first
    @biography                = @site.biography
    @home_info                = @site.home_info
    @first_time               = @site.first_time
    @get_in_contact_content   = @site.get_in_contact_content
    @podcast                  = @site.podcast
  end
end

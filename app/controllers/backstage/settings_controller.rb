class Backstage::SettingsController < ApplicationController
  def index
    @site = Site.first
    @biography                = @site.biography
    @first_time               = @site.first_time
    @get_in_contact_content   = @site.get_in_contact_content
  end
end

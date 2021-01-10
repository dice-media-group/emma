class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!

  before_action :collect_sets_for_the_frontdoor
  before_action :set_general_info

  def collect_sets_for_the_frontdoor
    @upcoming_meetups ||=  Meetup.where('end_date >= ?',  Date.today).order("start_date DESC").first(5)
    @linked_icon_data ||=  PublisherAcct.all_links_and_icons
    @linked_icons_for_footer = ["instagram",  "youtube", "facebook", "twitter", "snapchat", "linkedin", "podcast"]

  end
  # Controllers can call this to add classes to the body tag
  def add_body_css_class(css_class)
    @body_css_classes ||= []
    @body_css_classes << css_class
  end

  def set_general_info
    @site = Site.first
    @text_number = @site.general_info.text_number
    if @site.general_info.is_team_website? == true
      @texting_phrase = "TEXT US"
    else
      @texting_phrase = "TEXT ME"
    end   
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end
end

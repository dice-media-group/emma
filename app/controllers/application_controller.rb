class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!

  before_action :collect_sets_for_the_frontdoor
  before_action :set_general_info
  before_action :set_js_environment

  def collect_sets_for_the_frontdoor
    @upcoming_meetups         ||=  Meetup.coming_soon
    @linked_icon_data         ||=  PublisherAcct.all_links_and_icons
    @linked_icons_for_footer  ||= PublisherAcct.linked_icons_for_footer


  end
  # Controllers can call this to add classes to the body tag
  def add_body_css_class(css_class)
    @body_css_classes ||= []
    @body_css_classes << css_class
  end

  def set_general_info
    @site                         = Site.first
    @text_number                  = @site.general_info.text_number
    @newsletter_subscription_url  = @site.general_info.newsletter_sub_url

    if @site.general_info.is_team_website? == true
      @texting_phrase = "TEXT US"
      @possesive      = "our"
      @objective_case = "us"
      @hiring_phrase  = "Services"
    else
      @texting_phrase = "TEXT ME"
      @possesive      = "my"
      @objective_case = "me"
      @hiring_phrase  = "Hire Me"
    end

  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end

    def set_js_environment
      gon.segment_id = ENV["SEGMENT_ID"]
    end
end

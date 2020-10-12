class BlogController < ApplicationController

  def index
    render :layout => 'frontdoor'
    @facebook_url = PublisherAcct.find_by(name: "facebook").url
    @twitter_url  = PublisherAcct.find_by(name: "twitter").url
    @linkedin_url  = PublisherAcct.find_by(name: "linkedin").url
  end
end

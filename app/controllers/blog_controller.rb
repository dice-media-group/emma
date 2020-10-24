class BlogController < ApplicationController
  include Pagy::Backend
  layout "frontdoor"

  def index
    @pagy, @blog_entries = pagy(Blog::Entry.all, items: 10)

    @facebook_url = PublisherAcct.find_by(name: "facebook").url
    @twitter_url  = PublisherAcct.find_by(name: "twitter").url
    @linkedin_url  = PublisherAcct.find_by(name: "linkedin").url
  end
end

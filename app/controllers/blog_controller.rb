class BlogController < ApplicationController
  include Pagy::Backend
  layout "frontdoor"

  def index
    @pagy, @blog_entries  = pagy(Blog::Entry.published, items: 10)
    @billboard_entry      = Blog::Entry.featured.first
    @blog_featured_2nd_and_3rd = Blog::Entry.featured_2nd_and_3rd
    @facebook_url         = PublisherAcct.find_by(name: "facebook").url
    @twitter_url          = PublisherAcct.find_by(name: "twitter").url
    @linkedin_url         = PublisherAcct.find_by(name: "linkedin").url
  end
end

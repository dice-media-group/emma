class PodcastsController < ApplicationController
  def index
    render :layout => 'frontdoor'
    @site     = Site.first
    @podcast  = Podcast.first
  end
end

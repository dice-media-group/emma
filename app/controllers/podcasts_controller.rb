class PodcastsController < ApplicationController
  def index
    render :layout => 'frontdoor'
    @site     = Site.first
    @podcast  = Podcast.first
    @publishers = PublisherAcct.where("network_kind = ?", "podcast")
  end
end

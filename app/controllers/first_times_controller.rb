class FirstTimesController < ApplicationController
  before_action :set_first_time, only: [:show]

  layout "frontdoor"

  def show
    @sidebar_icons  = PublisherAcct.sidebar_icons.first(6)
    @youtube_video_id = @first_time.featured_youtube_video_url.to_s.split('/').last 
    
    @featured_youtube_image_url                 = @first_time.featured_youtube_image_url
    if @featured_youtube_image_url.to_s.length  == 0
      @featured_youtube_image_url   = "https://via.placeholder.com/727x384.png?text=Featured+YouTube+Video"
    end

  end

  # GET /first_times/new
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_time
      @first_time = FirstTime.first
    end

    # Only allow a list of trusted parameters through.
    # def first_time_params
    #   params.require(:first_time).permit(:first_name, :last_name, :blurb, :twitter_handle, :featured_image_src, :featured_youtube_video_url)
    # end
end

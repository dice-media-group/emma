class FirstTimesController < ApplicationController
  before_action :set_first_time, only: [:show]

  layout "frontdoor"

  def show
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

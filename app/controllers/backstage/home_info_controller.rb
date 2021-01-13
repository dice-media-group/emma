class Backstage::HomeInfoController < ApplicationController
  def edit
    @home_info = Site.first.home_info
  end

  # PATCH/PUT /backstage/home_info/1
  def update
  @home_info = Site.first.home_info
    respond_to do |format|
      if @home_info.update(home_info_params)
        format.html { redirect_to backstage_index_path, notice: 'Biography was successfully updated.' }
        # format.json { render :show, status: :ok, location: @home_info }
      else
        format.html { render :edit }
        # format.json { render json: @home_info.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def home_info_params
    params.require(:home_info).permit(
                                      :biography_blurb, 
                                      :video_billboard_url, 
                                      :watch_this_video_url, 
                                      :site_id,:bio_link_text, :watch_this_poster_url                                      
                                      )
  end


end
# 
# => #<HomeInfo id: 3, home_info_blurb: "Carl Tanner is the Chairman of Second Star Labs, a...", video_billboard_url: "https://cdn.plyr.io/static/demo/View_From_A_Blue_M...", watch_this_video_url: "https://www.youtube.com/embed/z5tugxy70MY", site_id: 5, created_at: "2021-01-02 01:01:39", updated_at: "2021-01-06 17:53:07", bio_link_text: "Carl Tanner Builds Full-Stack Builds Web Apps", watch_this_poster_url: "https://via.placeholder.com/1024x576?text=Watch+Th...">
#
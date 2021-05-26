class Backstage::PodcastController < ApplicationController
  before_action :authenticate_user!

  def edit
    @podcast = Site.first.podcast
  end

  # PATCH/PUT /backstage/podcast/1
  def update
    @podcast = Site.first.podcast
    respond_to do |format|
      if @podcast.update(podcast_params)
        format.html { redirect_to backstage_index_path, notice: 'Biography was successfully updated.' }
        # format.json { render :show, status: :ok, location: @podcast }
      else
        format.html { render :edit }
        # format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def podcast_params
    params.require(:podcast).permit(:billboard_image_url, :headline,:title, :podcast_player_src, :body, :network_kind)
  end


end

class Backstage::BiographyController < ApplicationController
  before_action :authenticate_user!

  def edit
    @biography = Site.first.biography
  end

  # PATCH/PUT /backstage/biography/1
  def update
    @biography = Site.first.biography
    respond_to do |format|
      if @biography.update(biography_params)
        format.html { redirect_to backstage_index_path, notice: 'Biography was successfully updated.' }
        # format.json { render :show, status: :ok, location: @biography }
      else
        format.html { render :edit }
        # format.json { render json: @biography.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def biography_params
    params.require(:biography).permit(:title, :body, :header_photo_url)
  end


end

class Backstage::FirstTimeController < ApplicationController
  def edit
    @site = Site.first
    @first_time = Site.first.first_time
  end

  # PATCH/PUT /blog/first_time/1
    # PATCH/PUT /backstage/first_time/1

    def update
      @site = Site.first
      @first_time = @site.first_time
    respond_to do |format|
      if @first_time.update(first_time_params)
        format.html { redirect_to backstage_index_path, notice: 'first_time was successfully updated.' }
        # format.json { render :show, status: :ok, location: @first_time }
      else
        format.html { render :edit }
        # format.json { render json: @first_time.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def first_time_params
    params.require(:first_time).permit(:billboard_image_url, 
                                        :billboard_image_title,
                                        :first_name, 
                                        :last_name, 
                                        :blurb, 
                                        :twitter_handle, 
                                        :featured_image_src,
                                        :featured_youtube_video_url,
                                        :featured_youtube_image_url,
                                        :biography, 
                                        :body)
  end

end

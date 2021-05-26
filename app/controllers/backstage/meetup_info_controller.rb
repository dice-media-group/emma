class Backstage::MeetupInfoController < ApplicationController
    before_action :authenticate_user!

    def edit
        @site = Site.first
        @meetup_info = @site.meetup_info
    end

    # PATCH/PUT /blog/meetup_info/1
    # PATCH/PUT /backstage/meetup_info/1

    def update
        @site = Site.first
        @meetup_info = @site.meetup_info

        respond_to do |format|
            if @meetup_info.update(meetup_info_params)
                format.html { redirect_to backstage_index_path, notice: 'meetup_info was successfully updated.' }
                # format.json { render :show, status: :ok, location: @meetup_info }
            else
                format.html { render :edit }
                # format.json { render json: @meetup_info.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    # Only allow a list of trusted parameters through.
    def meetup_info_params
        params.require(:meetup_info).permit(:billboard_image_url, :billboard_image_title)
    end
    
end

class Backstage::GeneralInfoController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @site = Site.first
    @general_info = Site.first.general_info
  end

  # PATCH/PUT /blog/general_info/1
    # PATCH/PUT /backstage/general_info/1

    def update
      @site = Site.first
      @general_info = @site.general_info
    respond_to do |format|
      if @general_info.update(general_info_params)
        format.html { redirect_to backstage_index_path, notice: 'general_info was successfully updated.' }
        # format.json { render :show, status: :ok, location: @general_info }
      else
        format.html { render :edit }
        # format.json { render json: @general_info.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def general_info_params
    params.require(:general_info).permit(:site_name,
                                        :plain_text_name,
                                        :text_number,
                                        :newsletter_sub_url,
                                        :meta_image,
                                        :default_meta_blurb,
                                        :tag_list,
                                        :is_team_website)
  end

end

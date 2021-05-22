class Backstage::GetInContactContentController < ApplicationController
  before_action :authenticate_user!

    def edit
    @site = Site.first
    @get_in_contact_content = @site.get_in_contact_content
  end

  # PATCH/PUT /blog/get_in_contact_content/1
    # PATCH/PUT /backstage/get_in_contact_content/1

    def update
      @site = Site.first
      @get_in_contact_content = @site.get_in_contact_content

      respond_to do |format|
      if @get_in_contact_content.update(get_in_contact_content_params)
        format.html { redirect_to backstage_index_path, notice: 'get_in_contact_content was successfully updated.' }
        # format.json { render :show, status: :ok, location: @get_in_contact_content }
      else
        format.html { render :edit }
        # format.json { render json: @get_in_contact_content.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def get_in_contact_content_params
    params.require(:get_in_contact_content).permit(:title, 
                                                  :body,
                                                  :youtube_url,
                                                  :youtube_image_url,
                                                  :page_message,
                                                  :first_name,
                                                  :last_name)
  end
end

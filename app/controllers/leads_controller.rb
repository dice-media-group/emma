class LeadsController < ApplicationController
  layout "frontdoor"

  # GET /leads/new
  def show
    @lead = Lead.new
  end


  # GET /leads/new
  def new
    @lead = Lead.new
    @site = Site.first
    @getcontactcontent = @site.get_in_contact_content

    @youtube_video_id = @getcontactcontent.youtube_url.to_s.split('/').last 
    
    @featured_youtube_image_url                 = @getcontactcontent.youtube_image_url
    if @featured_youtube_image_url.to_s.length  == 0
      @featured_youtube_image_url   = "https://via.placeholder.com/727x384.png?text=Featured+YouTube+Video"
    end

  end


  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

      if @lead.save
        redirect_to root_path, notice: 'Your message was sent. Thanks! '
      else
      render action: :show
      end
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(:name, 
                                  :phone, 
                                  :email_address, 
                                  :subject, 
                                  :message_body)
    end
end

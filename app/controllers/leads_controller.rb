class LeadsController < ApplicationController
  layout "frontdoor"

  # GET /leads/new
  def show
    @lead = Lead.new
  end


  # GET /leads/new
  def new
    @lead = Lead.new
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
      params.require(:lead).permit(:name, :phone, :email_address, :subject, :message_body)
    end
end

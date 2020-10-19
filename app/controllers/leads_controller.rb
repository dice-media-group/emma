class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  layout "frontdoor"



  # GET /leads/new
  def new
    @lead = Lead.new
  end


  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
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

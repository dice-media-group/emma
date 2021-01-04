class Backstage::MeetupsController < ApplicationController
  before_action :set_meetup, only: [:show, :edit, :update, :destroy]

  def index
    @meetups = Meetup.all  
  end

  def new
    @meetup = Meetup.new
  end

  def edit
  end

  # POST /meetups
  # POST /meetups.json
  def create
    @meetup = Meetup.new(meetup_params)

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to  backstage_meetups_url, notice: 'meetup was successfully created.' }
        # format.json { render :show, status: :created, location: @meetup }
      else
        format.html { render :new }
        # format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/meetup/1
  # PATCH/PUT /backstage/meetup/1

  def update

    respond_to do |format|
      if @meetup.update(meetup_params)
        format.html { redirect_to backstage_meetups_url, notice: 'meetup was successfully updated.' }
        # format.json { render :show, status: :ok, location: @meetup }
      else
        format.html { render :edit }
        # format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /meetups/1
  # DELETE /meetups/1.json
  def destroy
    @meetup.destroy
    respond_to do |format|
      format.html { redirect_to backstage_meetups_url, notice: 'meetup was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_meetup
    @meetup = Meetup.find(params[:id])
  end

  

  # Only allow a list of trusted parameters through.
  def meetup_params
    params.require(:meetup).permit(:title, 
      :start_date,
      :end_date, 
      :more_info_url, 
      :location)
  end
end

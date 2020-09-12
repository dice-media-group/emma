class Broadcaster::SocialEntriesController < ApplicationController
  before_action :set_broadcaster_social_entry, only: [:show, :edit, :update, :destroy]

  # GET /broadcaster/social_entries
  # GET /broadcaster/social_entries.json
  def index
    @broadcaster_social_entries = Broadcaster::SocialEntry.all
  end

  # GET /broadcaster/social_entries/1
  # GET /broadcaster/social_entries/1.json
  def show
  end

  # GET /broadcaster/social_entries/new
  def new
    @broadcaster_social_entry = Broadcaster::SocialEntry.new
  end

  # GET /broadcaster/social_entries/1/edit
  def edit
  end

  # POST /broadcaster/social_entries
  # POST /broadcaster/social_entries.json
  def create
    @broadcaster_social_entry = Broadcaster::SocialEntry.new(broadcaster_social_entry_params)

    respond_to do |format|
      if @broadcaster_social_entry.save
        format.html { redirect_to @broadcaster_social_entry, notice: 'Social entry was successfully created.' }
        format.json { render :show, status: :created, location: @broadcaster_social_entry }
      else
        format.html { render :new }
        format.json { render json: @broadcaster_social_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcaster/social_entries/1
  # PATCH/PUT /broadcaster/social_entries/1.json
  def update
    respond_to do |format|
      if @broadcaster_social_entry.update(broadcaster_social_entry_params)
        format.html { redirect_to @broadcaster_social_entry, notice: 'Social entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @broadcaster_social_entry }
      else
        format.html { render :edit }
        format.json { render json: @broadcaster_social_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcaster/social_entries/1
  # DELETE /broadcaster/social_entries/1.json
  def destroy
    @broadcaster_social_entry.destroy
    respond_to do |format|
      format.html { redirect_to broadcaster_social_entries_url, notice: 'Social entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcaster_social_entry
      @broadcaster_social_entry = Broadcaster::SocialEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def broadcaster_social_entry_params
      params.require(:broadcaster_social_entry).permit(:title, :broadcaster_theme_id)
    end
end

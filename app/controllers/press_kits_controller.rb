class PressKitsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_press_kit, only: [:show, :edit, :update, :destroy]

  # GET /press_kits
  # GET /press_kits.json
  def index
    render :layout => 'frontdoor'

    @press_kits             = PressKit.all
    @press_kit              = PressKit.first
    @press_kit_entries      = @press_kit.press_kit_entries
    @press_kit_photos       = @press_kit.press_kit_photos.all
    @press_kit_headshots    = @press_kit.press_kit_photos.published_headshots
    @press_kit_actionshots  = @press_kit.press_kit_photos.published_action_shots
    @social_links           = @press_kit.press_kit_links.social
    @website_links          = @press_kit.press_kit_links.website
    @company_links          = @press_kit.press_kit_links.company
  end

  # GET /press_kits/1
  # GET /press_kits/1.json
  def show
    render :layout => 'frontdoor'

    @press_kits             = PressKit.all
    @pk_entries      = @press_kit.press_kit_entries
    @press_kit_photos       = @press_kit.press_kit_photos.all
    @press_kit_headshots    = @press_kit.press_kit_photos.published_headshots
    @press_kit_actionshots  = @press_kit.press_kit_photos.published_action_shots
    @social_links           = @press_kit.press_kit_links.social
    @website_links          = @press_kit.press_kit_links.website
    @company_links          = @press_kit.press_kit_links.company
  end

  # GET /press_kits/new
  def new
    @press_kit = PressKit.new
  end

  # GET /press_kits/1/edit
  def edit
  end

  # POST /press_kits
  # POST /press_kits.json
  def create
    @press_kit = PressKit.new(press_kit_params)

    respond_to do |format|
      if @press_kit.save
        format.html { redirect_to @press_kit, notice: 'Press kit was successfully created.' }
        format.json { render :show, status: :created, location: @press_kit }
      else
        format.html { render :new }
        format.json { render json: @press_kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /press_kits/1
  # PATCH/PUT /press_kits/1.json
  def update
    respond_to do |format|
      if @press_kit.update(press_kit_params)
        format.html { redirect_to @press_kit, notice: 'Press kit was successfully updated.' }
        format.json { render :show, status: :ok, location: @press_kit }
      else
        format.html { render :edit }
        format.json { render json: @press_kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_kits/1
  # DELETE /press_kits/1.json
  def destroy
    @press_kit.destroy
    respond_to do |format|
      format.html { redirect_to press_kits_url, notice: 'Press kit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press_kit
      @press_kit = PressKit.first
    end

    # Only allow a list of trusted parameters through.
    def press_kit_params
      params.fetch(:press_kit, {})
    end
end

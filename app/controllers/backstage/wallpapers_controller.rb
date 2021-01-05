class Backstage::WallpapersController < ApplicationController
  before_action :set_wallpaper, only: [:show, :edit, :update, :destroy]
  SIZES = {:large=>"1080x1920", :medium=>"720x1280", :small=>"540x960", :tiny=>"480x800"}
  def index
    @wallpapers = Wallpaper.all  
  end

  def new
    @wallpaper  = Wallpaper.new
    @sizes      = SIZES
  end

  def edit
    @sizes      = SIZES
  end

  # POST /wallpapers
  # POST /wallpapers.json
  def create
    @wallpaper = Wallpaper.new(wallpaper_params)

    respond_to do |format|
      if @wallpaper.save
        format.html { redirect_to  backstage_wallpapers_url, notice: 'wallpaper was successfully created.' }
        # format.json { render :show, status: :created, location: @wallpaper }
      else
        format.html { render :new }
        # format.json { render json: @wallpaper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/wallpaper/1
  # PATCH/PUT /backstage/wallpaper/1

  def update

    respond_to do |format|
      if @wallpaper.update(wallpaper_params)
        format.html { redirect_to backstage_wallpapers_url, notice: 'wallpaper was successfully updated.' }
        # format.json { render :show, status: :ok, location: @wallpaper }
      else
        format.html { render :edit }
        # format.json { render json: @wallpaper.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /wallpapers/1
  # DELETE /wallpapers/1.json
  def destroy
    @wallpaper.destroy
    respond_to do |format|
      format.html { redirect_to backstage_wallpapers_url, notice: 'wallpaper was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_wallpaper
    @wallpaper = Wallpaper.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wallpaper_params
    params.require(:wallpaper).permit(:title, :device_size, :image)
  end
end
# Wallpaper(id: integer, title: string, device_size: string, created_at: datetime, updated_at: datetime)
class Backstage::PressKitPhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_press_kit_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_press_kit, only: [:index, :new, :create]

  # GET /press_kit_photos
  # GET /press_kit_photos.json
  def index
    @press_kit_photos = PressKitPhoto.all
  end

  # GET /press_kit_photos/1
  # GET /press_kit_photos/1.json
  def show
  end

  # GET /press_kit_photos/new
  def new
    @press_kit_photo = @press_kit.press_kit_photos.new
  end

  # GET /press_kit_photos/1/edit
  def edit
  end

  # POST /press_kit_photos
  # POST /press_kit_photos.json
  def create
    @site               = Site.first
    @press_kit          = @site.press_kit
    @press_kit_photo = @press_kit.press_kit_photos.new(press_kit_photo_params)

    respond_to do |format|
      if @press_kit_photo.save
        format.html { redirect_to  backstage_press_kit_photo_url(@press_kit_photo), notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @press_kit_photo }
      else
        format.html { render :new }
        format.json { render json: @press_kit_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /press_kit_photos/1
  # PATCH/PUT /press_kit_photos/1.json
  def update
    respond_to do |format|
      if @press_kit_photo.update(press_kit_photo_params)
        format.html { redirect_to backstage_press_kit_photo(@press_kit_photo), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @press_kit_photo }
      else
        format.html { render :edit }
        format.json { render json: @press_kit_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_kit_photos/1
  # DELETE /press_kit_photos/1.json
  def destroy
    @press_kit_photo.destroy
    respond_to do |format|
      format.html { redirect_to backstage_press_kit_photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press_kit_photo
      @press_kit_photo = PressKitPhoto.find(params[:id])
    end

    # parent
    def set_press_kit
      @site               = Site.first
      @press_kit          = @site.press_kit
    end
  
    # Only allow a list of trusted parameters through.
    def press_kit_photo_params
      params.require(:press_kit_photo).permit(:image, 
                                    :title, 
                                    :byline, 
                                    :description, 
                                    :dimensions_wxh, 
                                    :headshot_or_other, 
                                    :link,
                                    :publish_at
                                  )
    end
end
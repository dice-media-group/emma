class Backstage::MediaAppearancesController < ApplicationController
  before_action :set_media_appearance, only: [:show, :edit, :update, :destroy]

  def index
    @media_appearances = MediaAppearance.all  
  end

  def new
    @media_appearance = MediaAppearance.new
  end

  def edit
  end

  # POST /media_appearances
  # POST /media_appearances.json
  def create
    @media_appearance = MediaAppearance.new(media_appearance_params)

    respond_to do |format|
      if @media_appearance.save
        format.html { redirect_to  backstage_media_appearances_url, notice: 'media_appearance was successfully created.' }
        # format.json { render :show, status: :created, location: @media_appearance }
      else
        format.html { render :new }
        # format.json { render json: @media_appearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/media_appearance/1
  # PATCH/PUT /backstage/media_appearance/1

  def update

    respond_to do |format|
      if @media_appearance.update(media_appearance_params)
        format.html { redirect_to backstage_media_appearances_url, notice: 'media_appearance was successfully updated.' }
        # format.json { render :show, status: :ok, location: @media_appearance }
      else
        format.html { render :edit }
        # format.json { render json: @media_appearance.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /media_appearances/1
  # DELETE /media_appearances/1.json
  def destroy
    @media_appearance.destroy
    respond_to do |format|
      format.html { redirect_to backstage_media_appearances_url, notice: 'media_appearance was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_media_appearance
    @media_appearance = MediaAppearance.find(params[:id])
  end

  

  # Only allow a list of trusted parameters through.
  def media_appearance_params
    params.require(:media_appearance).permit(:title, 
      :title,
      :published_on, 
      :image)
  end
end
# => MediaAppearance(id: integer, title: string, published_on: datetime, created_at: datetime, updated_at: datetime)
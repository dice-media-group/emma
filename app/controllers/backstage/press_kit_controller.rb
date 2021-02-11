class Backstage::PressKitController < ApplicationController
  def edit
    @site       = Site.first
    @press_kit  = @site.press_kit
  end

  # PATCH/PUT /backstage/press_kit/1
  def update
    @press_kit = Site.first.press_kit
    respond_to do |format|
      if @press_kit.update(press_kit_params)
        format.html { redirect_to backstage_index_path, notice: 'Biography was successfully updated.' }
        # format.json { render :show, status: :ok, location: @press_kit }
      else
        format.html { render :edit }
        # format.json { render json: @press_kit.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def press_kit_params
    params.require(:press_kit).permit(:billboard_image_url, :billboard_image_title, :name, :birth_date, :birthplace, :biography)
  end

end
# => #<PressKit id: 4, created_at: "2021-01-02 01:02:02", updated_at: "2021-01-02 01:02:02", name: "name", birth_date: "-4712-01-01", birthplace: "birthplace", site_id: 5, billboard_image_url: nil, billboard_image_title: nil>

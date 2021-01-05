class Backstage::PressKitEntriesController < ApplicationController
  before_action :set_press_kit_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_press_kit, only: [:new, :create]

  def index
    @press_kit_entries = PressKitEntry.all  
  end

  def new
    @press_kit_entry = @press_kit.press_kit_entries.new
  end

  def edit
  end

  # POST /press_kit_entrys
  # POST /press_kit_entrys.json
  def create
    @press_kit_entry = @press_kit.press_kit_entries.new(press_kit_entry_params)

    respond_to do |format|
      if @press_kit_entry.save
        format.html { redirect_to  backstage_press_kit_entrys_url, notice: 'press_kit_entry was successfully created.' }
        # format.json { render :show, status: :created, location: @press_kit_entry }
      else
        format.html { render :new }
        # format.json { render json: @press_kit_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/press_kit_entry/1
  # PATCH/PUT /backstage/press_kit_entry/1

  def update

    respond_to do |format|
      if @press_kit_entry.update(press_kit_entry_params)
        format.html { redirect_to backstage_press_kit_entrys_url, notice: 'press_kit_entry was successfully updated.' }
        # format.json { render :show, status: :ok, location: @press_kit_entry }
      else
        format.html { render :edit }
        # format.json { render json: @press_kit_entry.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /press_kit_entrys/1
  # DELETE /press_kit_entrys/1.json
  def destroy
    @press_kit_entry.destroy
    respond_to do |format|
      format.html { redirect_to backstage_press_kit_entrys_url, notice: 'press_kit_entry was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_press_kit_entry
    @press_kit_entry = PressKitEntry.find(params[:id])
  end

  def set_press_kit
    @press_kit_entry = PressKit.first

  end

  

  # Only allow a list of trusted parameters through.
  def press_kit_entry_params
    params.require(:press_kit_entry).permit(:seller_name, :url, :book_id)
  end

end

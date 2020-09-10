class Broadcaster::OutlinesController < ApplicationController
  before_action :set_broadcaster_outline, only: [:show, :edit, :update, :destroy]

  # GET /broadcaster/outlines
  # GET /broadcaster/outlines.json
  def index
    @broadcaster_outlines = Broadcaster::Outline.all
  end

  # GET /broadcaster/outlines/1
  # GET /broadcaster/outlines/1.json
  def show
  end

  # GET /broadcaster/outlines/new
  def new
    @broadcaster_outline = Broadcaster::Outline.new
  end

  # GET /broadcaster/outlines/1/edit
  def edit
  end

  # POST /broadcaster/outlines
  # POST /broadcaster/outlines.json
  def create
    @broadcaster_outline = Broadcaster::Outline.new(broadcaster_outline_params)

    respond_to do |format|
      if @broadcaster_outline.save
        format.html { redirect_to @broadcaster_outline, notice: 'Outline was successfully created.' }
        format.json { render :show, status: :created, location: @broadcaster_outline }
      else
        format.html { render :new }
        format.json { render json: @broadcaster_outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcaster/outlines/1
  # PATCH/PUT /broadcaster/outlines/1.json
  def update
    respond_to do |format|
      if @broadcaster_outline.update(broadcaster_outline_params)
        format.html { redirect_to @broadcaster_outline, notice: 'Outline was successfully updated.' }
        format.json { render :show, status: :ok, location: @broadcaster_outline }
      else
        format.html { render :edit }
        format.json { render json: @broadcaster_outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcaster/outlines/1
  # DELETE /broadcaster/outlines/1.json
  def destroy
    @broadcaster_outline.destroy
    respond_to do |format|
      format.html { redirect_to broadcaster_outlines_url, notice: 'Outline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcaster_outline
      @broadcaster_outline = Broadcaster::Outline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def broadcaster_outline_params
      params.require(:broadcaster_outline).permit(:body)
    end
end

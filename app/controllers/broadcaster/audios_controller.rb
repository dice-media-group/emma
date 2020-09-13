class Broadcaster::AudiosController < ApplicationController
  before_action :get_theme,             only: [:index, :new]
  before_action :set_broadcaster_audio, only: [:show, :edit, :update, :destroy]

  # GET /broadcaster/audios
  # GET /broadcaster/audios.json
  def index
    # @broadcaster_audios = Broadcaster::Audio.all
    @broadcaster_audios = @theme.broadcaster_audios

  end

  # GET /broadcaster/audios/1
  # GET /broadcaster/audios/1.json
  def show
  end

  # GET /broadcaster/audios/new
  def new
    @broadcaster_audio = Broadcaster::Audio.new
  end

  # GET /broadcaster/audios/1/edit
  def edit
  end

  # POST /broadcaster/audios
  # POST /broadcaster/audios.json
  def create
    get_theme
    @broadcaster_audio = Broadcaster::Audio.new(broadcaster_audio_params)
    @broadcaster_audio.broadcaster_theme = @theme


    respond_to do |format|
      if @broadcaster_audio.save
        format.html { redirect_to @broadcaster_audio, notice: 'Audio was successfully created.' }
        format.json { render :show, status: :created, location: @broadcaster_audio }
      else
        format.html { render :new }
        format.json { render json: @broadcaster_audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcaster/audios/1
  # PATCH/PUT /broadcaster/audios/1.json
  def update
    respond_to do |format|
      if @broadcaster_audio.update(broadcaster_audio_params)
        format.html { redirect_to @broadcaster_audio, notice: 'Audio was successfully updated.' }
        format.json { render :show, status: :ok, location: @broadcaster_audio }
      else
        format.html { render :edit }
        format.json { render json: @broadcaster_audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcaster/audios/1
  # DELETE /broadcaster/audios/1.json
  def destroy
    @theme = @broadcaster_audio.broadcaster_theme

    @broadcaster_audio.destroy
    respond_to do |format|
      format.html { redirect_to @theme, notice: 'Audio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_theme
      @theme = Broadcaster::Theme.find(params[:theme_id])
    end

    def set_broadcaster_audio
      @broadcaster_audio = Broadcaster::Audio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def broadcaster_audio_params
      params.require(:broadcaster_audio).permit(:title, :broadcaster_theme_id)
    end
end

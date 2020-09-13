class Broadcaster::VideosController < ApplicationController
  before_action :set_broadcaster_video, only: [:show, :edit, :update, :destroy]

  # GET /broadcaster/videos
  # GET /broadcaster/videos.json
  def index
    @broadcaster_videos = Broadcaster::Video.all
  end

  # GET /broadcaster/videos/1
  # GET /broadcaster/videos/1.json
  def show
  end

  # GET /broadcaster/videos/new
  def new
    @broadcaster_video = Broadcaster::Video.new
  end

  # GET /broadcaster/videos/1/edit
  def edit
  end

  # POST /broadcaster/videos
  # POST /broadcaster/videos.json
  def create
    get_theme
    # @broadcaster_video = Broadcaster::Video.new(broadcaster_video_params)

    @broadcaster_video = Broadcaster::Video.new(broadcaster_video_params)
    @broadcaster_video.broadcaster_theme = @theme


    respond_to do |format|
      if @broadcaster_video.save
        format.html { redirect_to @broadcaster_video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @broadcaster_video }
      else
        format.html { render :new }
        format.json { render json: @broadcaster_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcaster/videos/1
  # PATCH/PUT /broadcaster/videos/1.json
  def update
    respond_to do |format|
      if @broadcaster_video.update(broadcaster_video_params)
        format.html { redirect_to @broadcaster_video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @broadcaster_video }
      else
        format.html { render :edit }
        format.json { render json: @broadcaster_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcaster/videos/1
  # DELETE /broadcaster/videos/1.json
  def destroy
    @theme = @broadcaster_video.broadcaster_theme
    @broadcaster_video.destroy
    respond_to do |format|
      format.html { redirect_to @theme, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_theme
      @theme = Broadcaster::Theme.find(params[:theme_id])
    end

    def set_broadcaster_video
      @broadcaster_video = Broadcaster::Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def broadcaster_video_params
      params.require(:broadcaster_video).permit(:title)
    end
end

class Broadcaster::ThemeAvatarsController < ApplicationController
  before_action :get_theme,             only: [:index, :new]
  before_action :set_broadcaster_theme_avatar, only: [:show, :edit, :update, :destroy]

  # GET /broadcaster/theme_avatars
  # GET /broadcaster/theme_avatars.json
  def index
    # @broadcaster_theme_avatars = Broadcaster::ThemeAvatar.all
    @broadcaster_theme_avatars = @theme.broadcaster_theme_avatars

  end

  # GET /broadcaster/theme_avatars/1
  # GET /broadcaster/theme_avatars/1.json
  def show
  end

  # GET /broadcaster/theme_avatars/new
  def new
    @broadcaster_theme_avatar = Broadcaster::ThemeAvatar.new
  end

  # GET /broadcaster/theme_avatars/1/edit
  def edit
  end

  # POST /broadcaster/theme_avatars
  # POST /broadcaster/theme_avatars.json
  def create
    get_theme
    @broadcaster_theme_avatar = Broadcaster::ThemeAvatar.new(broadcaster_theme_avatar_params)
    @broadcaster_theme_avatar.broadcaster_theme = @theme


    respond_to do |format|
      if @broadcaster_theme_avatar.save
        format.html { redirect_to @broadcaster_theme_avatar, notice: 'Audio was successfully created.' }
        format.json { render :show, status: :created, location: @broadcaster_theme_avatar }
      else
        format.html { render :new }
        format.json { render json: @broadcaster_theme_avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcaster/theme_avatars/1
  # PATCH/PUT /broadcaster/theme_avatars/1.json
  def update
    respond_to do |format|
      if @broadcaster_theme_avatar.update(broadcaster_theme_avatar_params)
        format.html { redirect_to @broadcaster_theme_avatar, notice: 'Audio was successfully updated.' }
        format.json { render :show, status: :ok, location: @broadcaster_theme_avatar }
      else
        format.html { render :edit }
        format.json { render json: @broadcaster_theme_avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcaster/theme_avatars/1
  # DELETE /broadcaster/theme_avatars/1.json
  def destroy
    @theme = @broadcaster_theme_avatar.broadcaster_theme

    @broadcaster_theme_avatar.destroy
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

    def set_broadcaster_theme_avatar
      @broadcaster_theme_avatar = Broadcaster::ThemeAvatar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def broadcaster_theme_avatar_params
      params.require(:broadcaster_theme_avatar).permit(:broadcaster_avatar_id, :broadcaster_theme_id)
    end
end

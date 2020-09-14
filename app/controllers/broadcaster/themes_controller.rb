class Broadcaster::ThemesController < Broadcaster::BaseController
  before_action :set_broadcaster_theme, only: [:show, :edit, :update, :destroy]

  # GET /broadcaster/themes
  # GET /broadcaster/themes.json
  def index
    @broadcaster_themes = Broadcaster::Theme.all
  end

  # GET /broadcaster/themes/1
  # GET /broadcaster/themes/1.json
  def show
  end

  # GET /broadcaster/themes/new
  def new
    @broadcaster_theme = Broadcaster::Theme.new
  end

  # GET /broadcaster/themes/1/edit
  def edit
  end

  # POST /broadcaster/themes
  # POST /broadcaster/themes.json
  def create
    @broadcaster_theme = Broadcaster::Theme.new(broadcaster_theme_params)

    respond_to do |format|
      if @broadcaster_theme.save
        format.html { redirect_to @broadcaster_theme, notice: 'Theme was successfully created.' }
        format.json { render :show, status: :created, location: @broadcaster_theme }
      else
        format.html { render :new }
        format.json { render json: @broadcaster_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcaster/themes/1
  # PATCH/PUT /broadcaster/themes/1.json
  def update
    respond_to do |format|
      if @broadcaster_theme.update(broadcaster_theme_params)
        format.html { redirect_to @broadcaster_theme, notice: 'Theme was successfully updated.' }
        format.json { render :show, status: :ok, location: @broadcaster_theme }
      else
        format.html { render :edit }
        format.json { render json: @broadcaster_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcaster/themes/1
  # DELETE /broadcaster/themes/1.json
  def destroy
    @broadcaster_theme.destroy
    respond_to do |format|
      format.html { redirect_to broadcaster_themes_url, notice: 'Theme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcaster_theme
      @broadcaster_theme = Broadcaster::Theme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def broadcaster_theme_params
      params.require(:broadcaster_theme).permit(:title)
    end
end

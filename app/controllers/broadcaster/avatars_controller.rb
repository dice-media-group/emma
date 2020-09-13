class Broadcaster::AvatarsController < ApplicationController
  before_action :set_broadcaster_avatar, only: [:show, :edit, :update, :destroy]

  # GET /broadcaster/avatars
  # GET /broadcaster/avatars.json
  def index
    @broadcaster_avatars = Broadcaster::Avatar.all
  end

  # GET /broadcaster/avatars/1
  # GET /broadcaster/avatars/1.json
  def show
  end

  # GET /broadcaster/avatars/new
  def new
    @broadcaster_avatar = Broadcaster::Avatar.new
  end

  # GET /broadcaster/avatars/1/edit
  def edit
  end

  # POST /broadcaster/avatars
  # POST /broadcaster/avatars.json
  def create
    @broadcaster_avatar = Broadcaster::Avatar.new(broadcaster_avatar_params)

    respond_to do |format|
      if @broadcaster_avatar.save
        format.html { redirect_to @broadcaster_avatar, notice: 'Avatar was successfully created.' }
        format.json { render :show, status: :created, location: @broadcaster_avatar }
      else
        format.html { render :new }
        format.json { render json: @broadcaster_avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcaster/avatars/1
  # PATCH/PUT /broadcaster/avatars/1.json
  def update
    respond_to do |format|
      if @broadcaster_avatar.update(broadcaster_avatar_params)
        format.html { redirect_to @broadcaster_avatar, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @broadcaster_avatar }
      else
        format.html { render :edit }
        format.json { render json: @broadcaster_avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcaster/avatars/1
  # DELETE /broadcaster/avatars/1.json
  def destroy
    @broadcaster_avatar.destroy
    respond_to do |format|
      format.html { redirect_to broadcaster_avatars_url, notice: 'Avatar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcaster_avatar
      @broadcaster_avatar = Broadcaster::Avatar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def broadcaster_avatar_params
      params.require(:broadcaster_avatar).permit(:name, :description)
    end
end

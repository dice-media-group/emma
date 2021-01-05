class HireMesController < ApplicationController
  before_action :set_hire_me, only: [:show, :edit, :update, :destroy]

  # GET /hire_mes
  # GET /hire_mes.json
  def index
    @hire_mes = HireMe.all
  end

  # GET /hire_mes/1
  # GET /hire_mes/1.json
  def show
  end

  # GET /hire_mes/new
  def new
    @hire_me = HireMe.new
  end

  # GET /hire_mes/1/edit
  def edit
  end

  # POST /hire_mes
  # POST /hire_mes.json
  def create
    @hire_me = HireMe.new(hire_me_params)

    respond_to do |format|
      if @hire_me.save
        format.html { redirect_to @hire_me, notice: 'Hire me was successfully created.' }
        format.json { render :show, status: :created, location: @hire_me }
      else
        format.html { render :new }
        format.json { render json: @hire_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hire_mes/1
  # PATCH/PUT /hire_mes/1.json
  def update
    respond_to do |format|
      if @hire_me.update(hire_me_params)
        format.html { redirect_to @hire_me, notice: 'Hire me was successfully updated.' }
        format.json { render :show, status: :ok, location: @hire_me }
      else
        format.html { render :edit }
        format.json { render json: @hire_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hire_mes/1
  # DELETE /hire_mes/1.json
  def destroy
    @hire_me.destroy
    respond_to do |format|
      format.html { redirect_to hire_mes_url, notice: 'Hire me was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hire_me
      @hire_me = HireMe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hire_me_params
      params.require(:hire_me).permit(:billboard_image_filename, :headline, :body, :site_id)
    end
end

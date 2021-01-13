class Backstage::PublisherAcctsController < ApplicationController
  before_action :set_publisher_acct, only: [:show, :edit, :update, :destroy]

  def index
    @publisher_accts = PublisherAcct.all  
  end

  def new
    @network_kinds = PublisherAcct.all.map {|x| x.network_kind}.uniq 
    # @h              = {}
    # @network_kinds = PublisherAcct.all.map {|x| @h[x.network_kind]=  x.network_kind}.uniq
    # @network_kinds  = OpenStruct.new(@h)
    @publisher_acct = PublisherAcct.new
  end

  def edit
    @network_kinds = PublisherAcct.all.map {|x| x.network_kind}.uniq!
  end

  # POST /publisher_accts
  # POST /publisher_accts.json
  def create
    @publisher_acct = PublisherAcct.new(publisher_acct_params)

    respond_to do |format|
      if @publisher_acct.save
        format.html { redirect_to  backstage_publisher_accts_url, notice: 'publisher_acct was successfully created.' }
        # format.json { render :show, status: :created, location: @publisher_acct }
      else
        format.html { render :new }
        # format.json { render json: @publisher_acct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/publisher_acct/1
  # PATCH/PUT /backstage/publisher_acct/1

  def update

    respond_to do |format|
      if @publisher_acct.update(publisher_acct_params)
        format.html { redirect_to backstage_publisher_accts_url, notice: 'publisher_acct was successfully updated.' }
        # format.json { render :show, status: :ok, location: @publisher_acct }
      else
        format.html { render :edit }
        # format.json { render json: @publisher_acct.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /publisher_accts/1
  # DELETE /publisher_accts/1.json
  def destroy
    @publisher_acct.destroy
    respond_to do |format|
      format.html { redirect_to backstage_publisher_accts_url, notice: 'publisher_acct was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_publisher_acct
    @publisher_acct = PublisherAcct.find(params[:id])
  end

  

  # Only allow a list of trusted parameters through.
  def publisher_acct_params
    params.require(:publisher_acct).permit(:name, :url, :font_awesome_class, :network_kind, :blurb, :svg_logo, :svg_logo_style)
  end

end

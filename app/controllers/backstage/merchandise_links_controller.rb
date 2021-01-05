class Backstage::MerchandiseLinksController < ApplicationController
  before_action :set_merchandise_link, only: [:show, :edit, :update, :destroy]
  before_action :set_books, only: [:new, :edit]

  def index
    @merchandise_links = MerchandiseLink.all  
  end

  def new
    @merchandise_link = MerchandiseLink.new
  end

  def edit
  end

  # POST /merchandise_links
  # POST /merchandise_links.json
  def create
    @merchandise_link = MerchandiseLink.new(merchandise_link_params)

    respond_to do |format|
      if @merchandise_link.save
        format.html { redirect_to  backstage_merchandise_links_url, notice: 'merchandise_link was successfully created.' }
        # format.json { render :show, status: :created, location: @merchandise_link }
      else
        format.html { render :new }
        # format.json { render json: @merchandise_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/merchandise_link/1
  # PATCH/PUT /backstage/merchandise_link/1

  def update

    respond_to do |format|
      if @merchandise_link.update(merchandise_link_params)
        format.html { redirect_to backstage_merchandise_links_url, notice: 'merchandise_link was successfully updated.' }
        # format.json { render :show, status: :ok, location: @merchandise_link }
      else
        format.html { render :edit }
        # format.json { render json: @merchandise_link.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /merchandise_links/1
  # DELETE /merchandise_links/1.json
  def destroy
    @merchandise_link.destroy
    respond_to do |format|
      format.html { redirect_to backstage_merchandise_links_url, notice: 'merchandise_link was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_merchandise_link
    @merchandise_link = MerchandiseLink.find(params[:id])
  end
  def set_books
    @books = Book.all
  end

  

  # Only allow a list of trusted parameters through.
  def merchandise_link_params
    params.require(:merchandise_link).permit(:seller_name, :url, :book_id)
  end
end

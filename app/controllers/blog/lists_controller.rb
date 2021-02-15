class Blog::ListsController < ApplicationController
  before_action :set_blog_list, only: [:show, :edit, :update, :destroy]

  # GET /blog/lists
  # GET /blog/lists.json
  def index
    @lists = Blog::List.sorted
  end

  # GET /blog/lists/1
  # GET /blog/lists/1.json
  def show
  end

  # GET /blog/lists/new
  def new
    @blog_list = Blog::List.new
  end

  # GET /blog/lists/1/edit
  def edit
  end

  # POST /blog/lists
  # POST /blog/lists.json
  def create
    @blog_list = Blog::List.new(blog_list_params)

    respond_to do |format|
      if @blog_list.save
        format.html { redirect_to @blog_list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @blog_list }
      else
        format.html { render :new }
        format.json { render json: @blog_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/lists/1
  # PATCH/PUT /blog/lists/1.json
  def update
    respond_to do |format|
      if @blog_list.update(blog_list_params)
        format.html { redirect_to @blog_list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_list }
      else
        format.html { render :edit }
        format.json { render json: @blog_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog/lists/1
  # DELETE /blog/lists/1.json
  def destroy
    @blog_list.destroy
    respond_to do |format|
      format.html { redirect_to blog_lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_list
      @blog_list = Blog::List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_list_params
      params.require(:blog_list).permit(:name, :position)
    end
end

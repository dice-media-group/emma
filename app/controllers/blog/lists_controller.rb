class Blog::ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :move]

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
    @list = Blog::List.new
  end

  # GET /blog/lists/1/edit
  def edit
  end

  # POST /blog/lists
  # POST /blog/lists.json
  def create
    @list = Blog::List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/lists/1
  # PATCH/PUT /blog/lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: blog_list_path(@list) }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog/lists/1
  # DELETE /blog/lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def move
    puts "***"
    puts "position is #{list_params[:position].to_i}"
    puts "list is #{@list.name.to_s}"
    @list.insert_at(list_params[:position].to_i)
    render action: :show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = Blog::List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :position)
    end
end

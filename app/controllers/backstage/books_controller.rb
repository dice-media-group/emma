class Backstage::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all  
  end

  def new
    @book = Book.new
  end

  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to  backstage_books_url, notice: 'book was successfully created.' }
        # format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        # format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/book/1
  # PATCH/PUT /backstage/book/1

  def update

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to backstage_books_url, notice: 'book was successfully updated.' }
        # format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        # format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to backstage_books_url, notice: 'book was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, 
      :byline,
      :description, 
      :jacket_location)
  end
end
# => Book(id: integer, title: string, byline: string, description: string, created_at: datetime, updated_at: datetime, jacket_location: text)
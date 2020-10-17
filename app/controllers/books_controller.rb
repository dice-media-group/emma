class BooksController < ApplicationController
  layout "frontdoor"

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    render :layout => 'frontdoor'
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end


end

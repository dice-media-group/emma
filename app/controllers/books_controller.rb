class BooksController < ApplicationController
  layout "frontdoor"

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @site         = Site.first
    @book_info  = @site.book_info

  end

  # GET /books/1
  # GET /books/1.json
  def show
  end


end

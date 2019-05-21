class BooksController < ApplicationController
  def show
  end

  def index
  end

  def create
  	book = Book.new(book_params)
  	book.save
  end

  def top
  end

  def about
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end

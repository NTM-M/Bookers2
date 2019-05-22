class BooksController < ApplicationController

  def show
  end

  def new
  	@book =Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.user_id = current_user.id
  	book.save
  	redirect_to books_path
  end

  def index
  end

  def update
  end

  def destroy
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

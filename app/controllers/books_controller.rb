class BooksController < ApplicationController

	before_action :authenticate_user!, except: :top
	before_action :correct_book, only: [:edit, :update]

  def show
  	@book = Book.find(params[:id])
  	@bookn = Book.new
  	@user = @book.user
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = current_user.books.build(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  		flash[:notice] = "You have created book successfully."
  		redirect_to book_path(@book.id)
  	else
   		@user = current_user
   		@books = Book.all.order(created_at: :desc)
  		render :index
  	end
  end

  def index
  	@books = Book.all.order(created_at: :desc)
  	@book = Book.new
  	@user = current_user
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		flash[:notice] = "You have updated book successfully."
  		redirect_to book_path(@book.id)
  	else
  		render :edit
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  def top
  end

  def about
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def correct_book
  	book = Book.find(params[:id])
  	if current_user != book.user
  		redirect_to books_path
  	end
  end
end

class BooksController < ApplicationController
  def start
  end

  def show
  	@book  = Book.find(params[:id])
  end
  
  def index
  	@book = Book.new
  	@books = Book.all
  end

  def new
  end

  def create
  	book = Book.new(book_params)
  	@book = Book.new
  	if book.save
  		flash[:notice] = "Book was successfully created."
  		redirect_to book_path(book)
  	else
  		@books =  Book.all
  		@book = book
  		render 'index'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  		flash[:notice] = "Book was successfully updated."
  		redirect_to book_path(book)
  	else
  		@book = book
  		render 'edit'
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "Book was successfully destroyed."
  	redirect_to books_path(@book)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
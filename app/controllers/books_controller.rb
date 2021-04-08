class BooksController < ApplicationController

  protect_from_forgery :except => [:destroy]
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(book)
    end
    # , notice: "Book was successfully created."
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book)
     # , notice: "Book was successfully created."
   end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

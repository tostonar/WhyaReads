class BooksController < ApplicationController
  before_action :find_book, only: [:show]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
  end

  private
  def find_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :purchase_url, :image_url)
  end
  
end

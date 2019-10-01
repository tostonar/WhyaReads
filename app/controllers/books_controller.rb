class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @categories = Book.all.collect {|b| b.category}.uniq
    @book.reviews.build
  end

  def create
    
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      @book.reviews.build
      render :new
    end
  end

  def show
  end

  def edit
    @categories = Book.all.collect {|b| b.category}.uniq
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private
  def find_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author_id, :description, :purchase_url, :image_url, :category, reviews_attributes: [:user_id, :comment, :rating, :book_id])
  end

end

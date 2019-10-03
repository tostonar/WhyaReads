class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]
  before_action :authorized, only: [:new, :create, :edit, :update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @categories = Book.all.collect {|b| b.category}.uniq
    # @statuses = List.all.collect {|l| l.status}.uniq
    @book.reviews.build
    # @book.lists.build
  end

  def create
    
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      @book.reviews.build
      # @book.lists.build
      render :new
    end
  end

  def show
    cookies[:book_id] = @book.id
    if @list
      @list = List.find {|l| l.book_id == @book.id && l.user_id == current_user.id}
    end
  end

  def edit
    @categories = Book.all.collect {|b| b.category}.uniq
  end

  def update
    @categories = Book.all.collect {|b| b.category}.uniq
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
    params.require(:book).permit(:title, :author_id, :description, :purchase_url, :image_url, :category, reviews_attributes: [:id, :comment, :rating])
  end

end

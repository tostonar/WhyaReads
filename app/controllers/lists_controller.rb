class ListsController < ApplicationController
  before_action :find_book, only: [:new, :create, :edit, :update]

  def index
    @lists = List.all
  end
  
  def new
    @list = List.new
  end

  def create
    @list = List.create(status: list_params[:status], user_id: current_user.id, book_id: @book.id)
    @statuses = List.all.collect {|l| l.status}.uniq
    redirect_to book_path(@book)
  end

  def edit
    @list = List.find {|l| l.book_id == @book.id && l.user_id == current_user.id}
  end

  def update
    @list = List.find {|l| l.book_id == @book.id && l.user_id == current_user.id}
    @list.update(status: list_params[:status], user_id: current_user.id, book_id: @book.id)
    redirect_to book_path(@book)
  end

  private

  def list_params
    params.require(:list).permit(:status, :user_id, :book_id)
  end

  def find_book
    @book = Book.find(cookies[:book_id])
  end

end

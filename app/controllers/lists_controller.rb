class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.create(status: list_params[:status], user_id: current_user.id, book_id: cookies[:book_id])
    @statuses = List.all.collect {|l| l.status}.uniq
    redirect_to book_path(cookies[:book_id])
  end

  def edit
  end

  def update
  end

  private

  def list_params
    params.require(:list).permit(:status, :user_id, :book_id)
  end

end

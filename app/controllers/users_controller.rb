class UsersController < ApplicationController
  
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    if params[:status]
      lists = List.select{|l| l.status == params[:status] && l.user_id == current_user.id}
      @books = lists.map {|l| l.book}
    else
      @books = List.select {|l| l.user_id == current_user.id}.map {|l| l.book}
    end
  end

  def edit
  end

  def update 
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end

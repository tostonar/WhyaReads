class ReviewsController < ApplicationController
  before_action :find_book
  before_action :authorized

  def new
    @review = Review.new
    # byebug
    # @review = @book.reviews.build
    # raise params.inspect
  end
  
  def create
    @review = Review.new(comment: review_params[:comment], rating: review_params[:rating], book_id: @book.id, user_id: current_user.id)
    if @review.save
      List.create(status: "Read", user_id: current_user.id, book_id: @book.id)
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    @review.update(comment: review_params[:comment], rating: review_params[:rating], book_id: @book.id, user_id: current_user.id)
    if @review.save
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = 'Review was successfully deleted.'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Something went wrong'
      redirect_to user_path(current_user)
    end
  end
  

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :user_id, :book_id)
  end

  def find_book
    @book = Book.find(cookies[:book_id])
  end

end

class ReviewsController < ApplicationController
  before_action :find_book

  def new
    @review = Review.new
    # byebug
    # @review = @book.reviews.build
    # raise params.inspect
    
  end
  
  def create
    @review = Review.new(comment: review_params[:comment], rating: review_params[:rating], book_id: @book.id, user_id: current_user.id)
    
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to new_book_review(@review)
    else
      render :edit
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

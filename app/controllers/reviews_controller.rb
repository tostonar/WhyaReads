class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to new_book_review(@review)
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

end

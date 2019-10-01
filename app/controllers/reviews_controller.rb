class ReviewsController < ApplicationController
  before_action :find_book
  def new
    @review = Review.new
  end

  def create
    byebug
    @review = Review.new(review_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
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
    @book = Book.find(params[:book_id])
  end

end

class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews
  has_many :lists

  accepts_nested_attributes_for :reviews

  validates :title, uniqueness: {case_sensitive: false}
  validates :author, presence: true
  validates :category, presence: true

  def average_rating
    review_count = self.reviews.size.to_f
    review_ratings = self.reviews.map(&:rating)
    review_sum = review_ratings.sum
    if review_count == 0
      return "No ratings yet" 
    else
      review_sum / review_count
    end
  end
end

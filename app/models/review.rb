class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :comment, presence: true
  validates :rating, presence: true, :inclusion => 1..5
  #validates :rating, numericality: true, :in => 1..5
end

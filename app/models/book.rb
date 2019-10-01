class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews
  validates :title, uniqueness: {case_sensitive: false}
  validates :author, presence: true
  validates :category, presence: true
end

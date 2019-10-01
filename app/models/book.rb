class Book < ApplicationRecord
  belongs_to :author
  validates :title, uniqueness: {case_sensitive: false}
  validates :author, presence: true
  validates :category, presence: true
end

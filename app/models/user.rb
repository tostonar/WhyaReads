class User < ApplicationRecord
    
    has_secure_password
    has_many :reviews
    has_many :lists
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end

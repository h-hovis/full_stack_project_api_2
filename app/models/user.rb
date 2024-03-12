class User < ApplicationRecord
    has_many :reviews
    has_many :items

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :reviews, presence: true
    validates :items, presence: true
end
class Item < ApplicationRecord
    has_many :reviews

    validates :name, presence: true
    validates :category, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :reviews, presence: true
end

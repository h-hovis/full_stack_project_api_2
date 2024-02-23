class Item < ApplicationRecord
    validates :name, presence: true
    validates :category, presence: true
    validates :price, presence: true
    validates :description, presence: true
end

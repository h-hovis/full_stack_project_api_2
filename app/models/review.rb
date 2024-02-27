class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :rating, presence: true
  validates :comment, presence: true
  validates_length_of :comment, maximum: 250
end

require 'rails_helper'

RSpec.describe Review, type: :model do
 
  context "valid attributes" do
    it 'is valid with valid attributes' do
      user = User.create(
        first_name: 'John', 
        last_name: 'Doe', 
        email: 'email@email.com', 
        username: 'johnd', 
        password: 'password')
      item = Item.create(
        name: 'Sample', 
        category: 'Test', 
        price: 20, 
        description: 'Sample description')
      review = Review.new(
        rating: 5, 
        comment: 'Sample comment', 
        user: user, 
        item: item)
      expect(review).to be_valid
    end
  end

  context "invalid attributes" do
    it 'is invalid without a rating' do
      user = User.create(
        first_name: 'John', 
        last_name: 'Doe', 
        email: 'email@email.com', 
        username: 'johnd', 
        password: 'password')
      item = Item.create(
        name: 'Sample', 
        category: 'Test', 
        price: 20, 
        description: 'Sample description')
      review = Review.new(
        comment: 'Sample comment', 
        user: user, 
        item: item)
      review.valid?
      expect(review.errors[:rating]).to include("can't be blank")
    end

    it 'is invalid when comment is too long' do
      user = User.create(
        first_name: 'John', 
        last_name: 'Doe', 
        email: 'email@email.com', 
        username: 'johnd', 
        password: 'password')
      item = Item.create(
        name: 'Sample', 
        category: 'Test', 
        price: 20, 
        description: 'Sample description')
      review = Review.new(
        rating: 5, 
        comment: "a" * 251, 
        user: user, 
        item: item)
      expect(review).not_to be_valid
      expect(review.errors[:comment]).to include("is too long (maximum is 250 characters)")
    end
  end
end

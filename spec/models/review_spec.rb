require 'rails_helper'

RSpec.describe Review, type: :model do
  it "belongs to a user and an item" do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    review = Review.new(rating: 5, comment: 'Sample comment', user: user, item: item)

    expect(review).to be_valid
    expect(review.user).to eq(user)
    expect(review.item).to eq(item)
  end
  
  # context "valid attributes" do
  #   it 'is valid with valid attributes' do
  #     user = User.create(first_name: 'John', last_name: 'Doe', email: 'email@email.com', username: 'johnd')
  #     review = Review.new(rating: 5, comment: 'Sample comment', user: user, item: item)
  #     expect(review).to be_valid
  #   end
  # end

  # context "invalid attributes" do
  #   it 'is invalid without a rating' do
  #     user = FactoryBot.create(:user)
  #     review = Review.new(comment: 'Sample comment', user: user, item: item)
  #     review.valid?
  #     expect(review.errors[:rating]).to include("can't be blank")
  #   end

  #   it 'is invalid when comment is too long' do
  #     user = FactoryBot.create(:user)
  #     review = Review.new(review: 5, comment: "a" * 251)
  #     review.valid?
  #     expect(review.errors[:comment]).to include("is too long (maximum is 250 characters)")
  #   end
  # end
end

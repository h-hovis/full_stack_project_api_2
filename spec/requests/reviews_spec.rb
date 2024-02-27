require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let(:expected_review_structure) do
    {
      "id"=> Integer,
      "rating"=> Integer,
      "comment"=> String,
    }
  end

  describe "GET /index" do
    before do
      create_list(:review, 3)
      get "/reviews"
      body = JSON.parse(response.body)
    end

    it 'returns reviews' do
      body.each do |review|
        expect(review.keys).to contain_exactly(*expected_review_structure.keys)
      end
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'does not return empty if reviews exist' do
      expect(body).not_to be_empty
    end

    it 'returns 3 reviews' do
      expect(body.size).to eq(3)
    end
  end

  describe "GET /show" do
    let (:review_id) { create(:review).id }

    before do
      get "/reviews/#{review_id}"
      body = JSON.parse(response.body)
    end

    it 'checks for the correct structure' do
      expect(body.keys).to contain_exactly(*expected_review_structure.keys)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    before do
      post "/reviews", params: attributes_for(:review)
      body = JSON.parse(response.body)
    end

    it 'checks for the correct structure' do
      expect(body.keys).to contain_exactly(*expected_review_structure.keys)
    end

    it 'count of reviews should increase by 1' do
      expect(Review.count).to eq(1)
    end

    it 'returns http success' do
       expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /update" do
    let (:review_id) { create(:review).id }

    before do
      put "/reviews/#{review_id}", params: { review: 'updated review' }
      body = JSON.parse(response.body)
    end

    it 'checks for the correct structure' do
      expect(body.keys).to contain_exactly(*expected_review_structure.keys)
    end

    it 'checks if the review is updated' do
      expect(Review.find(review_id).body).to eq('updated review')
    end

    it 'returns http success' do 
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    let (:review_id) { create(:review).id }

    before do
      delete "/reviews/#{review_id}"
    end

    it 'decrements the count of reviews by 1' do
      expect(Review.count).to eq(0)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end

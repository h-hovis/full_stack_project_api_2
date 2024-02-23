require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:expected_item_structure) do
    {
      "id"=> Integer,
      "name"=> String,
      "category"=> String,
      "price"=> Decimal,
      "description"=> String,
      "image_url"=> String,
    }
  end

  describe "GET /index" do
    before do
      create_list(:item, 10)
      get "/items"
      body = JSON.parse(response.body) 
    end

    it "returns items" do
      body.each do |item|
        expect(item.keys).to contain_exactly(*expected_item_structure.keys)
      end
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "does not return empty if items exist" do
      expect(body).not_to be_empty
    end

    it "returns 10 items" do
      expect(body.size).to eq(10)
    end
  end

  describe "GET /show" do
    let (:item_id) { create(:item).id }

    before do
      get "/items/#{item_id}"
      body = JSON.parse(response.body)
    end

    it "checks for the correct structure" do
      expect(body.keys).to contain_exactly(*expected_item_structure.keys)
    end

    it "returns http success" do  
      expect(response).to have_http_status(:success)
  end
end

describe "POST /create" do

  before do
    post "/items", params: attributes_for(:item)
    body = JSON.parse(response.body)
  end

  it "checks for the correct structure" do
    expect(body.keys).to contain_exactly(*expected_item_structure.keys)
  end

  it "count of items should increase by 1" do
    expect(Item.count).to eq(1)
  end

  it "returns http success" do
    expect(response).to have_http_status(:success)
  end
end

describe "PUT /update" do
  let (:item_id) { create(:item).id } 

  before do
    put "/items/#{item_id}", params: { item: 'updated item' }
    body = JSON.parse(response.body)
  end

  it "checks for the correct structure" do
    expect(body.keys).to contain_exactly(*expected_item_structure.keys)
  end

  it "checks if the item is updated" do
    expect(Item.find(item_id).item).to eq('updated item')
  end

  it "returns http success" do  
    expect(response).to have_http_status(:success)
  end
end

describe "DELETE /destroy" do
  let (:item_id) { create(:item).id }

  before do
    delete "/items/#{item_id}"
  end

  it "decrements the count of items by 1" do
    expect(Item.count).to eq(0)
  end

  it "returns http success" do
    expect(response).to have_http_status(:success)
  end
end
end
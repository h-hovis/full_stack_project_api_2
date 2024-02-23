require 'rails_helper'

RSpec.describe Item, type: :model do
  
  context "valid attributes" do
    it "is valid with valid attributes" do
      item = build(:item)
      expect(item).to be_valid
    end
  end

  context "invalid attributes" do
    it "is not valid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is not valid without a category" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end

    it "is not valid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is not valid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

  end
end

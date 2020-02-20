require 'rails_helper'

describe Product do
  describe 'create', 'update' do
    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    it "is invalid without a description" do
      product = build(:product, detail: "")
      product.valid?
      expect(product.errors[:detail]).to include("を入力してください")
    end
    it "is invalid without a status_id" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("を入力してください")
    end
    it "is invalid without a delivery_charge_id" do
      product = build(:product, postage: "")
      product.valid?
      expect(product.errors[:postage]).to include("を入力してください")
    end
    it "is invalid without a delivery_days_id" do
      product = build(:product, estimated_date: "")
      product.valid?
      expect(product.errors[:estimated_date]).to include("を入力してください")
    end
    it "is invalid without a price" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
    it "is invalid without a ship_from_id" do
      product = build(:product, shipping_area: "")
      product.valid?
      expect(product.errors[:shipping_area]).to include("を入力してください")
    end
  end
end
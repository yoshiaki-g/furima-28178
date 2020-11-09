require 'rails_helper'

RSpec.describe Item, type: :model do
  before '#create' do 
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "name,explanation,category_id,status_id,delivery_fee_id,shipping_area_id,delivery_date_id,value,imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it "imageがないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "explanationがないと出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idがないと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "status_idがないと出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "delivery_fee_idがないと出品できない" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end
      it "shipping_area_idがないと出品できない" do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number")
      end
      it "delivery_date_idがないと出品できない" do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date is not a number")
      end
      it "valueがないと出品できない" do
        @item.value = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end
      it "valueが300未満だと出品できない" do
        @item.value = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Value must be greater than or equal to 300")
      end
      it "valueが9999999より大きいと出品できない" do
        @item.value = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Value must be less than or equal to 9999999")
      end
      it "valueは半角数字出ないと出品できない" do
        @item.value = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Value is not a number")
      end
    end
  end
end

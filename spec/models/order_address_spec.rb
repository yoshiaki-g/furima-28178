require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before  do 
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'postal_code,prefecture_id,cities,address,building_name,phone_number,token,user_id,item_idが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存はできる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '商品購入機能がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていないと保存できないこと' do
        @order_address.postal_code = "1231234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_idが0の時は保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'citiesが空だと保存できないこと' do
        @order_address.cities = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが含まれると保存できないこと' do
        @order_address.phone_number = "090-0000-0000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end

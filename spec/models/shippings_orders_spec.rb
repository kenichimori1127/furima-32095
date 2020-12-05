require 'rails_helper'
RSpec.describe ShippingsOrders, type: :model do
    before do
      @shippings_orders = FactoryBot.build(:shippings_orders)
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
    end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'postcode,area_id,city,block,phone_numberが存在すれば登録できる' do
        expect(@shippings_orders).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @shippings_orders.token = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include "Token can't be blank"
      end
      it 'postcodeが空では登録できない' do
        @shippings_orders.postcode = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include "Postcode can't be blank", "Postcode Input correctly"
      end
      it 'postcodeはハイフンがないと登録できない' do
        @shippings_orders.postcode = 1234567
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include "Postcode Input correctly"
      end
      it 'area_idが空では登録できない' do
        @shippings_orders.area_id = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include "Area can't be blank", "Area select"
      end
      it 'area_idが1の場合は登録できないこと' do
        @shippings_orders.area_id = '1'
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include 'Area select'
      end
      it 'cityが空では登録できない' do
        @shippings_orders.city = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include "City can't be blank", "City is invalid. Input full-width characters."
      end
      it 'blockが空では登録できない' do
        @shippings_orders.block = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include "Block can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @shippings_orders.phone_number = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include "Phone number can't be blank", "Phone number is invalid."
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @shippings_orders.phone_number = '123456789123'
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include "Phone number is invalid."
      end
    end
  end
end

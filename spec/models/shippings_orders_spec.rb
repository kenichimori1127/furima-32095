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
        expect(@shippings_orders.errors.full_messages).to include 'クレジットカード情報を入力してください'
      end
      it 'postcodeが空では登録できない' do
        @shippings_orders.postcode = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include '郵便番号を入力してください'
      end
      it 'postcodeはハイフンがないと登録できない' do
        @shippings_orders.postcode = 1234567
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include '郵便番号はハイフンも入力してください'
      end
      it 'area_idが空では登録できない' do
        @shippings_orders.area_id = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include '都道府県を選択してください'
      end
      it 'area_idが1の場合は登録できないこと' do
        @shippings_orders.area_id = '1'
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include '都道府県を選択してください'
      end
      it 'cityが空では登録できない' do
        @shippings_orders.city = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include '市区町村を入力してください'
      end
      it 'blockが空では登録できない' do
        @shippings_orders.block = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include '番地を入力してください'
      end
      it 'phone_numberが空では登録できない' do
        @shippings_orders.phone_number = ''
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include '電話番号を入力してください'
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @shippings_orders.phone_number = '123456789123'
        @shippings_orders.valid?
        expect(@shippings_orders.errors.full_messages).to include '電話番号は11桁以内で入力してください'
      end
    end
  end
end

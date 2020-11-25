require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品登録がうまくいくとき' do
        it "product_name,explanation,price,category_id,status_id,burden_id,area_id,guideline_id,imageが存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end

      context '商品出品登録がうまくいかないとき' do
        it "product_nameがない場合は登録できないこと" do
          @item.product_name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Product name can't be blank"
        end
        it "explanationがない場合は登録できないこと" do
          @item.explanation = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Explanation can't be blank"
        end
        it "priceがない場合は登録できないこと" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't be blank"
        end
        it "価格の範囲が¥299以下の場合は登録できないこと" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include "Price Out of setting range"
        end
        it "価格が¥10,000,000以上の場合は登録できないこと" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include "Price Out of setting range"
        end
        it "販売価格は半角数字以外の場合は登録できないこと" do
          @item.price = "１０００００"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price Out of setting range"
        end
        it "category_idがない場合は登録できないこと" do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it "status_idがない場合は登録できないこと" do
          @item.status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Status can't be blank"
        end
        it "burden_idがない場合は登録できないこと" do
          @item.burden_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Burden can't be blank"
        end
        it "area_idがない場合は登録できないこと" do
          @item.area_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Area can't be blank"
        end
        it "guideline_idがない場合は登録できないこと" do
          @item.guideline_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Guideline can't be blank"
        end
        it "imageがない場合は登録できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
        end
      end
    end
  end
end

require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品登録がうまくいくとき' do
        it 'product_name,explanation,price,category_id,status_id,burden_id,area_id,guideline_id,imageが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品出品登録がうまくいかないとき' do
        it 'product_nameがない場合は登録できないこと' do
          @item.product_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include '商品名を入力してください'
        end
        it 'explanationがない場合は登録できないこと' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include '商品の説明を入力してください'
        end
        it 'priceがない場合は登録できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include '金額を入力してください'
        end
        it '価格の範囲が¥299以下の場合は登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include '金額は300以上の値にしてください'
        end
        it '価格が¥10,000,000以上の場合は登録できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include '金額は9999999以下の値にしてください'
        end
        it '販売価格は半角数字以外の場合は登録できないこと' do
          @item.price = '１０００００'
          @item.valid?
          expect(@item.errors.full_messages).to include '金額は数値で入力してください'
        end
        it 'category_idがない場合は登録できないこと' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include 'カテゴリーを選択してください'
        end
        it 'category_idが1の場合は登録できないこと' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include 'カテゴリーを選択してください'
        end
        it 'status_idがない場合は登録できないこと' do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include '商品の状態を選択してください'
        end
        it 'status_idが1の場合は登録できないこと' do
          @item.status_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include '商品の状態を選択してください'
        end
        it 'burden_idがない場合は登録できないこと' do
          @item.burden_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include '配送料の負担を選択してください'
        end
        it 'burden_idが1の場合は登録できないこと' do
          @item.burden_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include '配送料の負担を選択してください'
        end
        it 'area_idがない場合は登録できないこと' do
          @item.area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include '発送元の地域を選択してください'
        end
        it 'area_idが1の場合は登録できないこと' do
          @item.area_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include '発送元の地域を選択してください'
        end
        it 'guideline_idがない場合は登録できないこと' do
          @item.guideline_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include '発送日の目安を選択してください'
        end
        it 'guideline_idが1の場合は登録できないこと' do
          @item.guideline_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include '発送日の目安を選択してください'
        end
        it 'imageがない場合は登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include '出品画像を入力してください'
        end
      end
    end
  end
end

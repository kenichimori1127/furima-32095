require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,password_confirmation,first_name,family_name,first_name_kana,family_name_kana,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で半角英数混合あれば登録できる' do
        @user.password = '0000aa'
        @user.password_confirmation = '0000aa'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'ニックネームを入力してください'
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'emailが登録済みの場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passwordとpassword_confirmationが一致しない場合登録できない' do
        @user.password = '0000aaa'
        @user.password_confirmation = '0000bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passwordが半角英字のみの場合登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passwordが半角数字のみの場合登録できない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passwordが全角英数字の場合登録できない' do
        @user.password = 'ａａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名前を入力してください'
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない' do
        @user.first_name = 'ﾔﾏdaﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は全角文字で入力してください'
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '苗字を入力してください'
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない' do
        @user.first_name = 'ﾔﾏdaﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は全角文字で入力してください'
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名前(カナ)を入力してください'
      end
      it 'first_name_kanaが全角（カタカナ）以外の場合登録できない' do
        @user.first_name = 'ﾔﾏﾀﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は全角文字で入力してください'
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '苗字(カナ)を入力してください'
      end
      it 'family_name_kanaが全角（カタカナ）以外の場合登録できない' do
        @user.first_name = 'ﾔﾏﾀﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は全角文字で入力してください'
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '生年月日を入力してください'
      end
    end
  end
end

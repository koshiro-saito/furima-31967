require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end


    context 'ユーザー登録ができる時' do

      it 'nickname・email・password・password_confirmation・last_name・first_name・last_name_kana・first_name_kana・birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    
    end


    context 'ユーザー登録ができない時' do

      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@がないと登録できないこと' do
        @user.email = 'samplesample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが全角では登録できないこと' do
        @user.password = '１２３ＡＢＣ'
        @user.password_confirmation = '１２３ＡＢＣ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが半角英数字混合でなければ登録できないこと' do
        @user.password = '123456'
        @user.password = 'ABCDEF'
        @user.password_confirmation = '123456'
        @user.password_confirmation = 'ABCDEF'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameとfirst_nameが全角(漢字・ひらがな・カタカナ)以外では登録できないこと' do
        @user.last_name = '1'
        @user.last_name = 'A'
        @user.last_name = '@'
        @user.first_name = '1'
        @user.first_name = 'A'
        @user.first_name = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaとfirst_name_kanaは全角カタカナでなければ登録できないこと' do
        @user.last_name_kana = '雨'
        @user.last_name_kana = 'あ'
        @user.last_name_kana = 'A'
        @user.last_name_kana = '1'
        @user.last_name_kana = '@'
        @user.first_name_kana = '雨'
        @user.first_name_kana = 'あ'
        @user.first_name_kana = 'A'
        @user.first_name_kana = '1'
        @user.first_name_kana = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid', 'First name kana is invalid')
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    
    end

    
  end
end

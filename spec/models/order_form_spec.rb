require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '#create' do
    before do
      buyer = FactoryBot.create(:user)
      sell_item = FactoryBot.create(:item, user_id: buyer.id)
      @order_form = FactoryBot.build(:order_form, user_id: buyer.id, item_id: sell_item.id)
      sleep 0.1
    end

    context '商品購入ができる時' do
      it 'postal_code・prefecture_id・municipality・address・phone_number・token・user_id・item_idが存在すれば登録できること' do
        expect(@order_form).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'postal_codeが空では登録できないこと' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが空では登録できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空では登録できないこと' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'postal_codeはハイフンがなければ登録できないこと' do
        @order_form.postal_code = 0o123456
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end

      it 'phone_numberはハイフンがあると登録できないこと' do
        @order_form.phone_number = 0o12 - 3456 - 7890
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは11桁以上は登録できないこと' do
        @order_form.phone_number = '012345678901'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

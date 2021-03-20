require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end



    context '商品出品ができる時' do

      it 'image・item_name・description・category_id・status_id・delivery_fee_id・prefecture_id・time_to_ship_id・priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    
    end



    context '商品出品ができない時' do

      it 'item_nameが空では登録できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'status_idが空では登録できないこと' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it 'delivery_fee_idが空では登録できないこと' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it 'prefecture_idが空では登録できないこと' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'time_to_ship_idが空では登録できないこと' do
        @item.time_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Time to ship must be other than 1")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円以下では登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end


      it 'priceが9999999円以上では登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end



  end
end
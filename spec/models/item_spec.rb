require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、出品ができる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      
      it 'titleが空では登録できない' do
        @item.title = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it 'deliver_fee_cover_idが空では登録できない' do
        @item.deliver_fee_cover_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Deliver fee cover can't be blank"
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'deliver_date_idが空では登録できない' do
        @item.deliver_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Deliver date can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが¥300より小さいと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが¥9,999,999より大きいと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが全角数字だと登録できない' do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end
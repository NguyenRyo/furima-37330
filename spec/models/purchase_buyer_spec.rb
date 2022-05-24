require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  describe "購入情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1 # 0.1秒待機
      @purchase_buyer = FactoryBot.build(:purchase_buyer, user_id: user.id, item_id: item.id)
      sleep 0.1 # 0.1秒待機

    end

    describe '商品購入' do
      context '購入できる場合' do
        it "必要な情報を適切に入力して「購入」ボタンを押すと、商品の購入ができること" do
          expect(@purchase_buyer).to be_valid
        end
        
        it "建物名が空でも購入できる" do
          @purchase_buyer.building = ''
          expect(@purchase_buyer).to be_valid
        end
      end
      
      context '購入できない場合' do
        it "tokenが空では登録できないこと" do
          @purchase_buyer.token = nil
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Token can't be blank")
        end
  
        it "郵便番号が空では購入できない" do
          @purchase_buyer.postalcode = ''
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Postalcode is invalid. Enter it as follows (e.g. 123-4567)")
        end
  
        it '郵便番号がハイフン無しでは購入できない' do
          @purchase_buyer.postalcode = '0000000'
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Postalcode is invalid. Enter it as follows (e.g. 123-4567)")
        end
  
        it '郵便番号が８桁では購入できない' do
          @purchase_buyer.postalcode = '000-00000'
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Postalcode is invalid. Enter it as follows (e.g. 123-4567)")
        end

        it '郵便番号が６桁では購入できない' do
          @purchase_buyer.postalcode = '00-0000'
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Postalcode is invalid. Enter it as follows (e.g. 123-4567)")
        end

        it '郵便番号が全角では購入できない' do
          @purchase_buyer.postalcode = '０００−００００'
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Postalcode is invalid. Enter it as follows (e.g. 123-4567)")
        end

        it '都道府県が空では購入できない' do
          @purchase_buyer.prefecture_id = '0'
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Prefecture can't be blank")
        end
  
        it '市町村区が空では購入できない' do
          @purchase_buyer.city = ''
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("City can't be blank")
        end
  
        it '番地が空では購入できない' do
          @purchase_buyer.address = ''
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空では購入できない' do
          @purchase_buyer.tel = ''
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Tel can't be blank")
        end

        it '電話番号が全角では購入できない' do
          @purchase_buyer.tel = '００００００００００'
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Tel Phone number is invalid. Input only number with half-width")
        end

        it 'userが紐付いていなければ購入できない' do
          @purchase_buyer.user_id = nil
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("User can't be blank")
        end

        it 'itemが紐付いていなければ購入できない' do
          @purchase_buyer.item_id = nil
          @purchase_buyer.valid?
          expect(@purchase_buyer.errors.full_messages).to include("Item can't be blank")
        end

      end
    end
  end
end

require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  describe "購入情報の保存" do
    before do
      user = FactoryBot.create(:user)
      @purchase_buyer = FActoryBot.build(:purchase_buyer, user_id: user.id)
    end

    describe '商品購入' do
      context '購入できる場合' do
        it "必要な情報を適切に入力して「購入」ボタンを押すと、商品の購入ができること" do
          expect(@purchase_buyer).to be_valid
        end
        
        it "建物名が空でも購入できる"
        end
      end
      
      context '購入できない場合' do
        it 'カード番号が空では購入できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        
        it '有効期限が空では購入できない' do
          @user.email = ''  # emailの値を空にする
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
  
        it 'セキュリティコードが空では購入できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include "Email has already been taken"
        end
  
        it "郵便番号が空では購入できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
  
        it '郵便番号がハイフン無しでは購入できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
  
        it '郵便番号が８桁では購入できない' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password include both letters and numbers")
        end

        it '郵便番号が６桁では購入できない' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password include both letters and numbers")
        end

        it '郵便番号が全角では購入できない' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password include both letters and numbers")
        end

        it '都道府県が空では購入できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password include both letters and numbers")
        end
  
        it '市町村区が空では購入できない' do
          @user.password = 'aaaaaａ'
          @user.password_confirmation = 'aaaaaａ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password include both letters and numbers")
        end
  
        it '番地が空では購入できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '電話番号が空では購入できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '電話番号１２桁では購入できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '電話番号が全角では購入できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end
end

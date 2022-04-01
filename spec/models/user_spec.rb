require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必要な情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合/ユーザー情報' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      
      it 'emailが空では登録できない' do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'aaaaaａ'
        @user.password_confirmation = 'aaaaaａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    context '新規登録できない場合/本人情報確認' do
      it 'firstname_kanjiが空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kanji can't be blank"
      end
      
      it 'lastname_kanjiが空では登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kanji can't be blank"
      end

      it ' お名前_firstname(全角)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.firstname_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kanji require full-width character"
      end

      it ' お名前_lastname(全角)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.lastname_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kanji require full-width character"
      end

      it 'firstname_furiganaが空では登録できない' do
        @user.firstname_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname furigana can't be blank"
      end
      
      it 'lastname_furiganaが空では登録できない' do
        @user.lastname_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname furigana can't be blank"
      end

      it '生年月日emailが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

    end
  end
end
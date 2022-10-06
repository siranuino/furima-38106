require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "name、email、passwordとpassword_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "family_nameが空では登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "family_name_kanaのフリガナは全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it "first_name_kanaのフリガナは全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    
      it 'passwordが全角では登録できない' do
        @user.password = 'ａｂｃｄｅｆｇｈ'
        @user.password_confirmation = 'ａｂｃｄｅｆｇｈ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "family_nameに半角文字が含まれていると登録できない" do
        @user.family_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_nameに半角文字が含まれていると登録できない" do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "family_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.family_name_kana = 'あ阿a1_'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it "first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = 'あ阿a1_'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "emailに@を含まないと登録できない" do
        @user.email = 'yamadatarou.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

    end
  end
end
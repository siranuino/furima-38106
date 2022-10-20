require 'rails_helper'

RSpec.describe OrderMailingAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_mailing_address = FactoryBot.build(:order_mailing_address, item_id: item.id, user_id: user.id)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it "post_code、area_id、municipality、address、phone_number、tokenが存在すれば購入できる" do
        expect(@order_mailing_address).to be_valid
      end

      it 'building_nameは空でも購入できる' do
        @order_mailing_address.building_name = ''
        expect(@order_mailing_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空では購入できないこと' do
        @order_mailing_address.post_code = nil
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @order_mailing_address.post_code = '1234567'
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'area_idが未選択では購入できないこと' do
        @order_mailing_address.area_id = 1
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Area must be other than 1")
      end

      it 'municipalityは空では購入できない' do
        @order_mailing_address.municipality = ''
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressは空では保存できない' do
        @order_mailing_address.address = ''
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberは空では購入できない' do
        @order_mailing_address.phone_number = ''
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは12桁以上では購入できない' do
        @order_mailing_address.phone_number = '012345678910'
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは9桁以下では購入できない' do
        @order_mailing_address.phone_number = '012345678'
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberはハイフンを含んだ形式では購入できない' do
        @order_mailing_address.phone_number = '090-4444-44' #11桁
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは全角を含んだ形式では購入できない' do
        @order_mailing_address.phone_number = '０９０１２３４１２３４' #11桁
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空では購入できない' do
        @order_mailing_address.token = nil
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Token can't be blank")
      end

      it "userが紐付いていなければ出品できない" do
        @order_mailing_address.user_id = nil
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐付いていなければ出品できない" do
        @order_mailing_address.item_id = nil
        @order_mailing_address.valid?
        expect(@order_mailing_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
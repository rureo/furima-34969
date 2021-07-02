require 'rails_helper'

RSpec.describe OrdereShippment, type: :model do
  before do
    @order_shippment = FactoryBot.build(:order_shippment)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code,ship_where_from_id,city,house_number,building_name,phone_number が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end



    context '商品購入できないとき' do
      it 'postal_codeが空だと商品購入できない' do
        @user.postal_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal_code can't be blank")
      end

      it 'ship_where_from_idが空では商品購入できない' do
        @user.ship_where_from_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Ship_where_from_idcan't be blank")
      end

      it 'cityが空では商品購入できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end


      it 'house_numberが空では商品購入できない' do
        @user.house_numbe = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("House_numbercan't be blank")
      end


      it 'building_nameが空では商品購入できない' do
        @user.building_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Building_name can't be blank")
      end



      it 'phone_numberが空では商品購入できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone_number can't be blank")
      end
require 'rails_helper'

RSpec.describe OrderShippment, type: :model do
  before do
    @order_shippment = FactoryBot.build(:order_shippment)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code,ship_where_from_id,city,house_number,building_name,phone_number が存在すれば登録できる' do
        expect(@order_shippment).to be_valid
      end
    end



    context '商品購入できないとき' do
      it 'postal_codeが空だと商品購入できない' do
        @order_shippment.postal_code = ''
        @order_shippment.valid?
        expect(@order_shippment.errors.full_messages).to include("Postal code can't be blank")
      end


      it 'postal_codeにハイフンがないと商品購入できない' do
        @order_shippment.postal_code = '6771267'
        @order_shippment.valid?
        expect(@order_shippment.errors.full_messages).to include("Postal code is invalid")
      end


      it 'phone_numberが空では商品購入できない' do
        @order_shippment.phone_number = ''
        @order_shippment.valid?
        expect(@order_shippment.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは11桁以内でないと登録できないこと" do
        @order_shippment.phone_number = '677127799'
        @order_shippment.valid?
        expect(@order_shippment.errors.full_messages).to include("Phone number is invalid")
      end
      

      it 'ship_where_from_idが空では商品購入できない' do
        @order_shippment.ship_where_from_id = 1
        @order_shippment.valid?
        expect(@order_shippment.errors.full_messages).to include("Ship where from must be other than 1")
      end

      it 'cityが空では商品購入できない' do
        @order_shippment.city = ''
        @order_shippment.valid?
        expect(@order_shippment.errors.full_messages).to include("City can't be blank")
      end


      it 'house_numberが空では商品購入できない' do
        @order_shippment.house_number = ''
        @order_shippment.valid?
        expect(@order_shippment.errors.full_messages).to include("House number can't be blank")
      end




    
    end

  end
end
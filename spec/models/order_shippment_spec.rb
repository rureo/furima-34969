require 'rails_helper'

RSpec.describe OrderShippment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_shippment = FactoryBot.build(:order_shippment, user_id: @user.id, item_id: @item.id)
sleep(1)

  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code,ship_where_from_id,city,house_number,phone_number,price,token,user_id,item_idが存在すれば登録できる' do
        expect(@order_shippment).to be_valid
      end



      it 'building_nameが空の時も商品購入できる' do
        @order_shippment.building_name = ''
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

      it "phone_numberは10-11桁でないと登録できないことと" do
        @order_shippment.phone_number = '677-677-799'
        @order_shippment.valid?
        expect(@order_shippment.errors.full_messages).to include("Phone number is invalid")
      end
      
      it "phone_numberは12桁でないと登録できないことと" do
        @order_shippment.phone_number = '7677-7677-7799'
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



    
        it "tokenが空では登録できないこと" do
          @order_shippment.token = nil
          @order_shippment.valid?
          expect(@order_shippment.errors.full_messages).to include("Token can't be blank")
        end

        it "user_idがないと登録できないこと" do
          @order_shippment.user_id = nil
          @order_shippment.valid?
          expect(@order_shippment.errors.full_messages).to include("User can't be blank")
        end


        it "item_idがないと登録できないこと" do
          @order_shippment.item_id = nil
          @order_shippment.valid?
          expect(@order_shippment.errors.full_messages).to include("Item can't be blank")
        end

      end
 

  end
end


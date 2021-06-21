require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
  @item = FactoryBot.build(:item)

 end



  describe 'ユーザー新規登録' do
    context '商品出品できるとき' do
      it 'nameとdescription、category_id,status_id,who_pay_shipping_charge_id,ship_where_from_id,delivery_day_id,price,user が存在すれば登録できる' do
        expect(@item).to be_valid
      
      end
    end

    context '商品出品できないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

        it 'status_idが空だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it 'who_pay_shipping_charge_idが空だと登録できない' do
        @item.who_pay_shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Who pay shipping charge must be other than 1")
      end
     
      it 'ship_where_from_idが空だと登録できない' do
        @item.ship_where_from_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship where from must be other than 1")
      end
    
      it 'delivery_day_idが空だと登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end
  
      it 'priceが空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '商品価格が299円以下では出品できない' do
        @item.price = 277
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '商品価格が10_000_000円以上では出品できない' do
        @item.price = 77777777
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end


      it '商品価格が半角英数字混合では出品できない' do
        @item.price = "776np77"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end


      it '商品価格が半角英字のみでは出品できない' do
        @item.price = "sfasscs"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '商品価格が全角文字では出品できない' do
        @item.price = "７７６７７７"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

     



      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end



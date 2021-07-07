class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :user_to_index, only: [:index]
  before_action :sold_to_index, only: [:index]
 
  def index
    
    @item= Item.find(params[:item_id])
    @order_shippment = OrderShippment.new
  end
  
  def create
    @item= Item.find(params[:item_id])

@order_shippment = OrderShippment.new(order_params)
if @order_shippment.valid?
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price, 
    card: order_params[:token],   
    currency: 'jpy'                 
  )


  @order_shippment.save
  redirect_to root_path
else
  render:index
end

end


private





def order_params

params.require(:order_shippment).permit(:postal_code, :ship_where_from_id, :city, :house_number, :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])

end



def user_to_index
  @item= Item.find(params[:item_id])
 
  if current_user.id == @item.user_id
    redirect_to  root_path
  end
end



def sold_to_index
  if @item.order.present?
    redirect_to  root_path
  end

end

end



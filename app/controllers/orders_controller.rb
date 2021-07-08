class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :set_item, only: [:index, :create, :user_to_index]
  before_action :sold_to_index, only: [:index]
  
  def index
    @order_shippment = OrderShippment.new
  end
  
  def create
    @order_shippment = OrderShippment.new(order_params)
   if @order_shippment.valid?
      pay_item
      @order_shippment.save
      redirect_to root_path
     else
      render:index
    end
  end



  private


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
 　 end

  def set_item
    @item=Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shippment).permit(:postal_code, :ship_where_from_id, :city, :house_number, :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end



  def sold_to_index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to  root_path
    end
  end

end
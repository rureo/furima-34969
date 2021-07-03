class OrdersController < ApplicationController
  def index
    @item= Item.find(params[:item_id])
    @order_shippment = OrderShippment.new
  end
  
  def create

@item=Item.find(params[:item_id])
@order_shippment = OrderShippment.new(order_params)
if @order_shippment.valid?
  @order_shippment.save
  redirect_to root_path
else
  render:index
end


  end


private

def order_params

params.require(:order_shippment).permit(:postal_code, :ship_where_from_id, :city, :house_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])

end


end



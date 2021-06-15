class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item=Item.new
  end

  def new
  
end
  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render :index
    end
 
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category, :status, :who_pay_shipping_charge ,:ship_where_from, :delivery_day,:image, :price, :user ).merge(user_id: current_user.id)
  end




end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  
end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render :new
    end
 
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category, :status, :who_pay_shipping_charge ,:ship_where_from, :delivery_day,:image, :price, :user ).merge(user_id: current_user.id)
  end




end

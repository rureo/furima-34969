class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def index
    @items=Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end


  def show
    @item=Item.find(params[:id])
  end


 def edit
@item=Item.find(params[:id])
 end


def update
@item=Item.find(params[:id])
if @item.update(item_params)
redirect_to item_path

else
  render :edit
end
end




  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :who_pay_shipping_charge_id, :ship_where_from_id,
                                 :delivery_day_id, :image, :price).merge(user_id: current_user.id)
  end
end

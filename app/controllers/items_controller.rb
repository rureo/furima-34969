class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]



  def index
    @items=Item.all.order("created_at DESC")
  end


  def new
    @item = Item.new
  end

  def show

  end


  def edit

  end



 
  def update

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

  def set_item
    @item = Item.find(params[:id])
   end


  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :who_pay_shipping_charge_id, :ship_where_from_id,
                                 :delivery_day_id, :image, :price).merge(user_id: current_user.id)
  end



  def move_to_index
 
    unless current_user.id == @item.user_id
    redirect_to action: :index
    end
  end
  end
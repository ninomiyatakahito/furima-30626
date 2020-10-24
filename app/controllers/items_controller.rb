class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.valid?
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def set_item
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :prefecture_id, :shopping_cost_id, :shopping_days_id, :price).merge(user_id: current_user.id)
  end
end

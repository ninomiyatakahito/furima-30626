class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, ]
  before_action :forbid_login_user, only: [:edit, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :prefecture_id, :shopping_cost_id, :shopping_days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def forbid_login_user
    unless current_user.id == @item.user.id
      redirect_to item_path
    end
  end
end

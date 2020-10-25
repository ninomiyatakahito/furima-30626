class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update]
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
         redirect_to item_path, method: :get
      else
        render 'edit'
      end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :prefecture_id, :shopping_cost_id, :shopping_days_id, :price).merge(user_id: current_user.id)

  end

  def set_item
    @item = Item.find(params[:id])
  end
end

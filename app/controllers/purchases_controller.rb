class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @purchase_address.save
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :street, :building_name, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

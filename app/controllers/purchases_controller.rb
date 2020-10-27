class PurchasesController < ApplicationController
  

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @purchase_street_address = PurchasestreetAddress.new(purchase_params)
    @purchase_street_address.save
    @item = Item.find(params[:item_id])
  end

  private

  def purchase_params
    params.require(:purchasestreet_address).permit(:post_code, :prefecture_id, :city, :address, :appointment_name, :phone_number, :purchase).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

end

class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  before_action :move_to_sold_out, only: [:index]
  before_action :move_to_signed_in, only: [:index]
  
  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user.id == @item.user_id
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :street, :building_name, :phone_number, :purchase).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def move_to_sold_out
    if @item.purchase.present? 
      redirect_to root_path 
    end
  end

  def move_to_index
    if @item.user_id == current_user.id && user_signed_in?
      redirect_to root_path 
    end
  end

  

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end
end

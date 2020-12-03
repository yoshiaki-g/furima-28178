class OrdersController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :confirmation, only:[:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :cities, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def confirmation
    unless user_signed_in? && current_user.id != @item.user_id || @item.order == nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.value,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end

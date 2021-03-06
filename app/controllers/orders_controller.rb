class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @shippings_orders = ShippingsOrders.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.order.present?
     redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @shippings_orders = ShippingsOrders.new(shipping_params)
    if @shippings_orders.valid?
      pay_item
      @shippings_orders.save
     redirect_to root_path
    else
      render :index
    end
  end
  private
  def shipping_params
    params.require(:shippings_orders).permit(:postcode, :area_id, :city, :block, :building, :phone_number).merge(token: params[:token], item_id: @item.id, user_id: current_user.id)
  end
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: shipping_params[:token],
        currency: 'jpy'
      )
  end
end

class OrdersController < ApplicationController
  def index
    @shippings_orders = ShippingsOrders.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @shippings_orders = ShippingsOrders.new(shipping_params)
    if @shippings_orders.valid?
      @shippings_orders.save
     redirect_to root_path
    else
      render :index
    end
  end
  private
  def shipping_params
    params.require(:shippings_orders).permit(:postcode, :area_id, :city, :block, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end
end

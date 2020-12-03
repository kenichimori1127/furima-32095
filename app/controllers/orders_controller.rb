class OrdersController < ApplicationController
  def index
    @order = ShippingsOrders.new
    @item = Item.find(params[:item_id])
  end

  def create
    @shippings_orders = ShippingsOrders.new(shipping_params)
    # if @shippings_orders.valid?
     if @shippings_orders.save
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def shipping_params
    params.permit(:postcode, :area_id, :city, :block, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end

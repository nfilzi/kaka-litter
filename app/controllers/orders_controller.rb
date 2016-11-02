class OrdersController < ApplicationController
  decorates_assigned :order
  
  def new
    @order = Order.new
    @order.order_details.build
  end

  def create
    # shipping_address
    # paying_method
    # observations
  end

  def order_params
    params.require(:order).permit(:shipping_address, :paying_method, :observations, :order_details_attributes => [:id, :quantity, :product_id])
  end
end

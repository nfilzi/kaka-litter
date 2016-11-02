class OrdersController < ApplicationController
  decorates_assigned :order
  
  def new
    @order = Order.new
    @order.order_details.build
    @products = Product.all
  end

  def create
    raise
  end

  private
  def order_params
    params.require(:order).permit(:shipping_address, :paying_method, :observations, :order_details_attributes => [:product1 => [:quantity], :product2 => [:quantity]])
  end
end

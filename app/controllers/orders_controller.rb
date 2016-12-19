class OrdersController < ApplicationController
  before_action :set_order_context, only: [:create, :update]
  
  def new
    @order      = Order.new
    @order.order_details.build
    @products   = Product.all
    @companies  = current_user.companies
  end

  def create
    order_details_attributes = order_params[:order_details_attributes].values
    @order = Order.new(order_params)
  
    @order.order_details.build(order_details_attributes)
    @order.first_order! if current_user.no_orders?
    @order.compute_total_price_ht!

    if @order.save
      flash[:notice] = "Your order has been issued. You should receive an email shortly!"
      redirect_to root_path
    else
      flash[:notice] = "There was an issue with your order. Please try again."
      render 'new'
    end
    
  end

  private
  def order_params
    params.require(:order).permit(:shipping_address, :company_id, :observations, :order_details_attributes => [:product_id, :quantity])
  end

  def set_order_context
    @products   = Product.all
    @companies  = current_user.companies
  end
end

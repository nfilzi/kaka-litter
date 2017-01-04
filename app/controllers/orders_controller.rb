class OrdersController < ApplicationController
  before_action :current_user_has_company, only: [:new]
  before_action :set_order_context, only: [:new, :create, :update]

  def new
    @order      = Order.new
    @shipping_address = ShippingAddress.new
    @order.order_details.build
  end

  def create
    @order = Order.new(order_params)
    @order.company = current_user.company
    @order.first_order! if current_user.company.no_orders_yet?
    @order.compute_total_price_ht!

    if @order.save
      ::GoogleDriveServices::Orders::AddOrderToSpreadsheetService.new(@order).call
      flash[:notice] = "Your order has been issued. You should receive an email shortly!"
      redirect_to root_path
    else
      flash[:notice] = "There was an issue with your order. Please try again."
      render 'new'
    end
  end

  private
  def order_params
    params.require(:order).permit(:shipping_address_id, :observations, :order_details_attributes => [:product_id, :quantity])
  end

  def set_order_context
    @products           = Product.all
    @shipping_addresses = current_user.company.shipping_addresses
  end

  def current_user_has_company
    unless current_user.company
      flash[:alert] = "You haven't registered your company yet. You need to before being able to issue orders."
      redirect_to new_company_url 
    end
  end
end

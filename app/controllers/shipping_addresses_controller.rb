class ShippingAddressesController < ApplicationController
  def create
    @shipping_address         = ShippingAddress.new(shipping_address_params)
    @shipping_address.user    = current_user

    if @shipping_address.save
      respond_to do |format|
        format.html { redirect_to new_order_path }
        format.js   # <-- will render `app/views/shipping_addresses/create.js.erb`
      end
    else
      respond_to do |format|
        flash[:notice] = "Something went wrong, please try again!"
        format.html { redirect_to new_order_path }
        format.js   # <-- will render `app/views/shipping_addresses/create.js.erb`
      end
    end
  end

  def update
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:designation, :country)
  end
end

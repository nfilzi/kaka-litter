module Admin
  class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update]
    before_action :verify_admin!

    def index
      @products = Product.all
    end

    def edit
    end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:designation, :unit_price, :features)
    end

    def verify_admin!
      unless current_user.admin
        redirect_to root_path, alert: "You're not authorized to access this part of the website."
      end
    end
  end
end

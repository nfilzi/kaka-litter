class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :legal, :static_components]

  def home
    @box          = Product.find_by(sku: "litter-bag")
    @display_box  = Product.find_by(sku: "box-of-six-litter-bags")
  end

  def shop
    @products = Product.all
  end

  def legal
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :legal, :static_components]

  def home
    @box = Product.find(1)
    @display_box = Product.find(2)
  end

  def shop
    @products = Product.all
  end

  def legal
  end
end



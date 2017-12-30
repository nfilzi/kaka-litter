class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :legal, :static_components]

  def shop
    @products = Product.all
  end

  def legal
  end

  def success
  end
end



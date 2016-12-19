class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :static_components]

  def home
    @products = Product.all
  end

  def static_components
  end
end

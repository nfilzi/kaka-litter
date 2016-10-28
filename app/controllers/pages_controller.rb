class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :static_components]

  def home
  end

  def static_components
  end
end

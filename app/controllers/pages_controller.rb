class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :static_components]

  def home
    @products = Product.all
  end

  def static_components
  end

  def test_api_google_drive
    session = GoogleDrive::Session.from_config(ENV['GOOGLE_DRIVE_JSON_FILEPATH'])
    spd = session.create_spreadsheet("hello_world")
    p spd
    raise
  end
end



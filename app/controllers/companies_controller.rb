class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user

    if @company.save
      ::GoogleDriveServices::Companies::AddCompanyToSpreadsheetService.new(@company).call
      ShippingAddress.create(country: @company.country, designation: @company.billing_address, company: @company)
      # FIXME according issue #29
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :billing_address, :country, :phone_number, :vat_number)
  end
end

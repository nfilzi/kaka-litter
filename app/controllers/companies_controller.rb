class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    
    if @company.save
      ::GoogleDriveServices::Companies::AddCompanyToSpreadsheetService.new(@company).call
      # FIXME according issue #29
      redirect_to root_path
    else
      render 'new'
    end 
  end

  private
  def company_params
    permitted_attributes = [:name, :billing_address, :phone_number, :vat_number, :salesman_email]
    params.require(:company).permit(permitted_attributes)
  end
end

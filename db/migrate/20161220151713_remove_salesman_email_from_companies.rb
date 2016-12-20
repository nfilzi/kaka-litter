class RemoveSalesmanEmailFromCompanies < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :salesman_email
  end
end

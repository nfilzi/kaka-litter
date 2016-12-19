class AddUserRefToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_reference :companies, :user, foreign_key: true, index: true
  end
end

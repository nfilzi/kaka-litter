class RemoveUserRefOnCompanies < ActiveRecord::Migration[5.0]
  def change
    remove_reference :companies, :user, index: true, foreign_key: true
  end
end

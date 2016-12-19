class RemoveUserCompanies < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_companies
  end
end

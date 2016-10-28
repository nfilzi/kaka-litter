class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true, index: true
      t.string :name
      t.string :billing_address
      t.string :phone_number
      t.string :vat_number
      t.string :salesman_email
    end
  end
end

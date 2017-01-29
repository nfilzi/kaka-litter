class AddCountryToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :shipping_addresses, :country, :string
    add_column :companies, :country, :string
  end
end

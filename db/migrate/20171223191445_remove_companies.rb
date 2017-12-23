class RemoveCompanies < ActiveRecord::Migration[5.0]
  def change
    remove_reference :shipping_addresses, :company, foreign_key: true, index: true
    add_reference    :shipping_addresses, :user,    foreign_key: true, index: true
    remove_reference :orders,             :company, foreign_key: true, index: true
    add_reference    :orders,             :user,    foreign_key: true, index: true
    add_column       :users,              :vat_number, :string

    drop_table :companies
  end
end

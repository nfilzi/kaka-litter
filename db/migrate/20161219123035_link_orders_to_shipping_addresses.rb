class LinkOrdersToShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :shipping_address
    add_reference :orders, :shipping_address, index: true, foreign_key: true
  end
end

class RemoveUserRefFromShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_reference :shipping_addresses, :user, index: true, foreign_key: true
  end
end

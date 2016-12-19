class CreateShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :user, foreign_key: true, index: true
      t.references :company, foreign_key: true, index: true
      t.string :designation
    end
  end
end

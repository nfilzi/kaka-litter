class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references      :company, foreign_key: true, index: true
      t.string          :shipping_address
      t.string          :paying_method
      t.text            :observations
      t.float           :total_price_ht
      t.boolean         :first_order
    end
  end
end

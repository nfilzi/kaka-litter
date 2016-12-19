class RemovePayingMethodFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :paying_method
  end
end

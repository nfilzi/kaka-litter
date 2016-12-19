class RemoveUserRefFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_reference :orders, :user, foreign_key: true, index: true
  end
end

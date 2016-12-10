class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order, inverse_of: :order_details, autosave: true
  
  validates :product, :quantity, presence: true
end

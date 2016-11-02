class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  
  validates :product, :order, :quantity, presence: true
end

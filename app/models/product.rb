class Product < ApplicationRecord
  serialize :features
  has_many :order_details
  has_many :orders, through: :order_details
  
  
  validates :designation, :unit_price, :features, presence: true
end

class Company < ApplicationRecord
  belongs_to :user
  has_many :orders  
  has_many :shipping_addresses
  
  validates :name, :phone_number, :vat_number, :billing_address, presence: true

  def no_orders_yet?
    orders.empty?
  end
end

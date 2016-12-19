class Order < ApplicationRecord
  as_enum :paying_methods, [:card, :cash, :cheque, :wire_transfer], source: :paying_method, map: :string, prefix: 'payed_with'
  
  belongs_to :company
  belongs_to :user

  has_many :order_details, inverse_of: :order
  belongs_to :shipping_address
  
  accepts_nested_attributes_for :order_details
  
  validates :paying_method, :company, :shipping_address, :total_price_ht, presence: true
  
  def compute_total_price_ht!
    self.total_price_ht = order_details.reduce(0) do |total, order_detail| 
      total += order_detail.quantity * order_detail.product.unit_price
    end
  end

  def first_order!
    self.first_order = true
  end
end

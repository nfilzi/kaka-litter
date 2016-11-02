class Order < ApplicationRecord
  as_enum :paying_methods, [:card, :cash, :cheque, :wire_transfer], source: :paying_method, map: :string, prefix: 'payed_with'
  
  belongs_to :company
  has_many :order_details
  accepts_nested_attributes_for :order_details

  delegate :user, to: :company, allow_nil: true
  
  validates :paying_method, :company, :shipping_address, :total_price_ht, presence: true
  
  def compute_total_price_ht!
    self.total_price_ht = order_details.reduce(0) do |total, order_detail| 
      total += order_detail.quantity * order_detail.product.unit_price
    end
  end
end

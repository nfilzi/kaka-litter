class Order < ApplicationRecord
  belongs_to :company
  has_many :order_details, inverse_of: :order
  accepts_nested_attributes_for :order_details

  delegate :user, to: :company, allow_nil: true
  
  validates :company, :shipping_address, :total_price_ht, presence: true
  
  def compute_total_price_ht!
    self.total_price_ht = order_details.reduce(0) do |total, order_detail| 
      total += order_detail.quantity * order_detail.product.unit_price
    end
  end

  def first_order!
    self.first_order = true
  end
end

class Order < ApplicationRecord
  as_enum :paying_method, [:card, :cash, :cheque, :wire_transfer], source: :paying_method, map: :string, prefix: 'payed_with'
  
  belongs_to :company
  delegate :user, to: :company, allow_nil: true
  
  validates :paying_method, :company, :shipping_address, :total_price_ht, presence: true
end

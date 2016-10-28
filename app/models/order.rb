class Order < ApplicationRecord
  belongs_to :company
  as_enum :paying_method, [:card, :cash, :cheque, :wire_transfer], source: :paying_method, map: :string, prefix: 'paying_with'
  validates :paying_method, :company, :shipping_address, :total_price_ht, presence: true
end

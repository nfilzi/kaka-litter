class Company < ApplicationRecord
  has_many :orders
  validates :user, :name, :phone_number, :vat_number, :billing_address, presence: true
end

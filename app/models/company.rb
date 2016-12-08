class Company < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :user, :name, :phone_number, :vat_number, :billing_address, presence: true
end

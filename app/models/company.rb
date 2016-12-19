class Company < ApplicationRecord
  has_many :orders
  has_many :user_companies
  has_many :users, through: :user_companies
  validates :name, :phone_number, :vat_number, :billing_address, presence: true
end

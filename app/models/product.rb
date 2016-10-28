class Product < ApplicationRecord
  serialize :features

  validates :designation, :unit_price, :features, presence: true
end

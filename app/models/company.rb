class Company < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :user, presence: true
end

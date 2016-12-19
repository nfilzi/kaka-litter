class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_companies
  has_many :companies, through: :user_companies
  has_many :orders
  has_many :shipping_addresses

  validates :first_name, :last_name, :phone_number, presence: true
  
  def no_orders?
    orders.empty?
  end
end

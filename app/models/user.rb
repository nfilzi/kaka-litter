class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :company
  has_many :shipping_addresses

  validates :first_name, :last_name, :phone_number, presence: true
  
  def fullname
    "#{self.first_name} #{self.last_name}"
  end
end

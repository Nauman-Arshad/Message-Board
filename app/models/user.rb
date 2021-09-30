class User < ApplicationRecord
  has_many :messages
  has_many :comments
  validates :email, presence: true,  uniqueness: {
    # object = person object being validated
    # data = { model: "Person", attribute: "Username", value: <username> }
    message: ->(user, data) do
      " is already taken."
    end
  }
  validates :password, length: { in: 6..20 },numericality: { only_integer: true }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

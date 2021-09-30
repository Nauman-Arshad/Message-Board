class Message < ApplicationRecord
  belongs_to :user
  has_many :comments
  # validates_associated :comments
end

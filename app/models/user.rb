class User < ApplicationRecord
  has_many :owned_spots, class_name:"Spot", foreign_key: "owner_id"
  has_many :reservations
  has_many :spots, through: :reservations

  has_secure_password
end

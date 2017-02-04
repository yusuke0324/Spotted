require 'geocoder'

class Spot < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :reservations
  has_many :users, through: :reservations
  geocoded_by :address
  after_validation :geocode
end

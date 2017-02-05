require 'geocoder'
class Spot < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :reservations
  has_many :users, through: :reservations
  geocoded_by :address
  after_validation :geocode

  mount_uploader :picture, PictureUploader


  # before_save :address_latlon, if: ->(obj){obj.latitude.present? and obj.longitude.present?}
  # before_save :location_address, if: ->(obj){obj.address.present? and obj.address_changed?}

  # def location_address
  #   @latitude ||= Geocoder.coordinates(self.address)[0]
  #   self.latitude = @latitude
  #   @longitude ||= Geocoder.coordinates(self.address)[1]
  #   self.longitude = @longitude
  # end

  # def address_latlon
  #   coordinates = [self.latitude, self.longitude]
  #   @address ||= Geocoder.address(coordinates)
  #   self.address = @address
  # end
end

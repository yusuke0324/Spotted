class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :owned_spots, class_name:"Spot", foreign_key: "owner_id"
  has_many :reservations
  has_many :spots, through: :reservations
  has_one :current_reservation, class_name: 'reservation'

end

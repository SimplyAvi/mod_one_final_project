class ParkingLot < ActiveRecord::Base
  has_many :parking_spot
  has_many :driver, through: :parking_spot
end

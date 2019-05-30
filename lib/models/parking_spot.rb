class ParkingSpot < ActiveRecord::Base
  belongs_to :driver
  belongs_to :parking_lot
end

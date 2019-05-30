class Driver < ActiveRecord::Base
  has_many :parking_spots
  has_many :parking_lots, through: :parking_spots
end

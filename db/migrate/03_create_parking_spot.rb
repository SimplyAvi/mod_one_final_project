
  class CreateParkingSpot < ActiveRecord::Migration[5.0]
    def change
      create_table :parking_spots do |t|
        t.integer :parking_lot_id
        t.integer :driver_id
        t.string :zipcode
        t.string :num_park
      end
    end
  end


  class CreateParkingLot < ActiveRecord::Migration[5.0]
    def change
      create_table :parking_lots do |t|
        t.string :name
        t.string :zipcode
        t.string :num_park
      end
    end
  end

require_relative '../config/environment'
UserInterface.logo
response_array = []
# sign in as a user
# input zipcode where I want to park
# select from list of available parking-lots

# book a parking spot for that parking lot

UserInterface.welcome_message

puts "what is your name?"
driver_name = gets.chomp
user = Driver.find_by(name: driver_name)
if user
  puts "Welcome Back!"
else
  puts "what is your zip code?"
  zipcode = gets.chomp
  user = Driver.create(name: driver_name, zipcode: zipcode)
end


user_input = nil

while (user_input != "Exit") do
  user_input = UserInterface.main_menu

  case user_input
  # when "Update Zipcode"
  #
  #   puts "Your zipcode is currently: #{user.zipcode}"
  #   puts "please input your new zipcode:"
  #   zipcode = gets.chomp
  #   user.update(zipcode: zipcode)

  when "Find a Parking Spot"

    user_input = UserInterface.find_parking_spot_menu
    if user_input == "Find parking spot for my zipcode"
      available_spots = ParkingLot.where(zipcode: user.zipcode)
      users_selection = UserInterface.display_parking_spots(available_spots)
      user_selected_lot = ParkingLot.find_by(name: users_selection)
      user.parking_lots << user_selected_lot
    end
    # using these values update the amount of spots avalaible
    if user_input == "Enter a zipcode"
      zipcode = gets.chomp
      user.update(zipcode: zipcode)
      available_spots = ParkingLot.where(zipcode: user.zipcode)
      users_selection = UserInterface.display_parking_spots(available_spots)
      user_selected_lot = ParkingLot.find_by(name: users_selection)


      user.parking_lots << user_selected_lot
    end




  #

when "See Booked Spots"
  # binding.pry
  p user.parking_lots.map{|i| i.name}
  # p user.parking_spots
  # above has to be wrong
  #   # using this you should be able book a parking spot ahead of TIME
  #   puts "users_selection"







  when "Delete Reserved Parking"
      # user.parking_lots - has all of the info needed
    user_input = UserInterface.delete_booking(user.parking_spots)
      # binding.pry
    user.parking_spots.find(user_input).destroy
    user.reload
    p user.parking_lots

  if user_input
    p "You don't have any parking spots reserved"
  end














    # users_selection = UserInterface.delete_booking(user.parking_lots)
    # user.parking_lots.find_by(name: users_selection).destroy
    # user.parking_lots



  end













end



# puts "Which zipcode are you looking for parking in?"
# zipcode = gets.chomp
# driver_zip = Driver.create(name: driver_name, zipcode: zipcode)
#
# def finding_parking_lot_for_driver(driver_zip)
#     ParkingLot.all.select do |i|
#       i.zipcode.to_i == driver_zip.zipcode.to_i
#     end.map do |z|
#       # binding.pry
#       z.name
#   end
# end
# p finding_parking_lot_for_driver(driver_zip)

# puts "Here is the list of plots available for you to use! &finding_parking_lot_for_driver#(driver_zip)}"
# binding.pry
# Driver.first.parking_spots.find_by(parking_lot_id: 304).destroy

puts "HELLO WORLD"

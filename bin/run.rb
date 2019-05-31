require_relative '../config/environment'

system 'clear'
UserInterface.logo
response_array = []
# sign in as a user
# input zipcode where I want to park
# select from list of available parking-lots
# book a parking spot for that parking lot

UserInterface.welcome_message
puts "what is your name?"
driver_name = gets.chomp
system 'clear'
user = Driver.find_by(name: driver_name)
UserInterface.logo
if user
  puts "Welcome Back! #{driver_name}"
else
  puts "what is your zip code?"
  zipcode = gets.chomp
  user = Driver.create(name: driver_name, zipcode: zipcode)
end
user_input = nil

while (user_input != "Exit") do
  user_input = UserInterface.main_menu

  case user_input


  when "Find a Parking Spot"
    user_input = UserInterface.find_parking_spot_menu

    if user_input == "Pick a parking spot for my zipcode"
      available_spots = ParkingLot.where(zipcode: user.zipcode)
      users_selection = UserInterface.display_parking_spots(available_spots)
      user_selected_lot = ParkingLot.find_by(name: users_selection)
      user.parking_lots << user_selected_lot
    end
    if user_input == "Enter a zipcode you wish to find a parking spot in"
      zipcode = gets.chomp
        # if zipcode.is_a? Integer
        # binding.pry
        #   system 'clear'
        #   p
        # else
        # p "Invalid zipcode"

        # end
      user.update(zipcode: zipcode)
      available_spots = ParkingLot.where(zipcode: user.zipcode)
      users_selection = UserInterface.display_parking_spots(available_spots)
      user_selected_lot = ParkingLot.find_by(name: users_selection)
      user.parking_lots << user_selected_lot
      system 'clear'
      UserInterface.logo
    end


  when "See Your Booked Spots"
    # binding.pry
    system 'clear'
    UserInterface.logo
    p user.parking_lots.map(&:name).join(", ")
    puts "\n"

  when "Delete A Reserved Parking"
    # system 'clear'
    UserInterface.logo
    if user.parking_spots.empty?
      system 'clear'
      UserInterface.logo
      #edge case for no user input doesnt work
      p "You don't have any parking spots reserved"
    else
      user_input = UserInterface.delete_booking(user.parking_spots)
      UserInterface.logo
      user.parking_spots.find(user_input).destroy
      user.reload
      system 'clear'
      UserInterface.logo
      p user.parking_lots.map(&:name).join(", ")
    end
  end
end

# puts "HELLO WORLD"

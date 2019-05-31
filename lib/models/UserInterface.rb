module UserInterface
  PROMPT = TTY::Prompt.new
  def self.logo
    puts "
 _____       _      _          ______          _
|  _  |     (_)    | |         | ___ \\        | |
| | | |_   _ _  ___| | ________| |_/ /_ _ _ __| | __
| | | | | | | |/ __| |/ /______|  __/ _` | '__| |/ /
\\ \\/' / |_| | | (__|   <       | | | (_| | |  |   <
 \\_/\\_\\\\__,_|_|\\___|_|\\_\\      \\_|  \\__,_|_|  |_|\\_\\"



end



    def self.welcome_message
    puts "WELCOME TO QUICK-PARK"
        puts "\n"
    sleep 0.3
  end

  def self.main_menu
    PROMPT.select("What would you like to do?", [
      "Find a Parking Spot",
      "See Your Booked Spots",
      "Delete A Reserved Parking",
      "Exit"
    ])
  end

  def self.find_parking_spot_menu
    PROMPT.select("How would you like to search", [
      "Pick a parking spot for my zipcode",
      "Enter a zipcode you wish to find a parking spot in"

    ])
  end

  def self.display_parking_spots(parking_lots)
    PROMPT.select("Please select a parking lot:", parking_lots.map { |parking_lot| parking_lot.name } )
  end

  # def self.see_booked_spots
  #   PROMPT.select("This is your booked spot",[
  #     Driver.parking_lots
  #   ])
  # end

  def self.delete_booking(parking_spots)
    PROMPT.select("Which parking lot do you want to delete reservation from?", parking_spots.map {|chosen_spot| {chosen_spot.parking_lot.name => chosen_spot.id} })
  end

end

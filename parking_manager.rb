require_relative 'car'
require_relative 'parking'

class ParkingManager
  def initialize
    @parking = Parking.new
  end

  def show_menu
    option = 0

    print "\nThere are #{@parking.get_free_spots} free spots"
    print "\n1. Show the parked cars"
    print "\n2. Add a car"
    print "\n3. Remove a car"
    print "\n4. Exit\n"

    option = gets.chomp

    return manage_option(option)
  end

  # Returns false if the user picked 4 - Exit.
  # Otherwise, returns true
  def manage_option(option)
    case option
    when '1'
      for car in @parking.get_cars
        print car.get + "\n"
      end
    when '2'
      if @parking.get_free_spots - 1 <= 0
        print "The parking lot is full!"
        return true
      end
      print "Please provide the license plate number of the car to be added\n"
      licence_plate = gets.chomp
      car = Car.new(licence_plate)
      if !@parking.add_car(car)
        print "\nSomething went wrong when adding the car. It's possible that it is already inside the parking lot!"
        return true
      end
      @parking.set_free_spots(@parking.get_free_spots - 1)
    when '3'
      print "Please provide the license plate number of the car to be removed\n"
      licence_plate = gets.chomp
      car = Car.new(licence_plate)
      if @parking.remove_car(car)
        print "\nCar successfully removed!"
      else
        print "\nThis car is not in the parking lot!"
        return true
      end
      @parking.set_free_spots(@parking.get_free_spots + 1)
    when '4'
      return false
    else
      print "Invalid input! Please try again."
    end

    return true
  end
end

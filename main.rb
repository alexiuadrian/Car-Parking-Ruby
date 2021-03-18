require_relative 'parking_manager'

file = File.open('cars.txt', 'r')



parking_manager = ParkingManager.new(file)

while parking_manager.show_menu; end

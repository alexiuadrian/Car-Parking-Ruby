class Parking
  def initialize
    @cars = []
    @free_spots = 10
  end

  # Returns true if the car has been successfully added
  # Returns false otherwise
  def add_car(car)
    for c in @cars
      if c.get === car.get
        return false
      end
    end

    @cars.append(car)
    return true
  end

  # Returns true if the car has been successfully removed
  # Returns false otherwise
  def remove_car(car)
    for c in @cars
      if c.get == car.get
        @cars.delete(c)
        return true
      end
    end

    return false
  end

  def get_cars
    @cars
  end

  def set_free_spots(free_spots)
    @free_spots = free_spots
  end

  def get_free_spots
    @free_spots
  end
end
class Car
  def initialize; end

  def initialize(licence_plate)
    @licence_plate = licence_plate
  end

  def set(licence_plate)
    @licence_plate = licence_plate
  end

  def get
    return @licence_plate
  end
end

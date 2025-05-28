# frozen_string_literal: true

# Controls the queen
class Queen
  def initialize(location, type)
    @location = location
    @type = type
  end

  def move(new_location)
    if ((new_location[0] == @location[0]) ^ (new_location[1] == @location[1])) ||
       ((@location[0] - new_location[0]).abs == (@location[1] - new_location[1]).abs)
      @location = new_location
      return true
    end
    false
  end
end

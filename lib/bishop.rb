# frozen_string_literal: true

# Controls the bishop
class Bishop
  def initialize(location, type)
    @location = location
    @type = type
  end

  def move(new_location)
    if (@location[0] - new_location[0]).abs == (@location[1] - new_location[1]).abs
      @location = new_location
      return true
    end
    false
  end

  def to_s
    'B'.colorize(@type)
  end
end

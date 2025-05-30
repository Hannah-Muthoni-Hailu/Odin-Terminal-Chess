# frozen_string_literal: true

# Controls the king
class King
  attr_accessor :location, :type

  def initialize(location, type)
    @location = location
    @type = type
  end

  def move(new_location)
    if (new_location[0] - @location[0]).abs <= 1 && (new_location[1] - @location[1]).abs <= 1
      @location = new_location
      return true
    end
    false
  end

  def to_s
    'K'.colorize(@type)
  end
end

# frozen_string_literal: true

# Controls the game's rook
class Rook
  attr_accessor :location, :type

  def initialize(location, type)
    @location = location
    @type = type
  end

  def move(new_loc)
    if (new_loc[0] == @location[0]) ^ (new_loc[1] == @location[1])
      @location = new_loc
      return true
    end
    false
  end

  def to_s
    'R'.colorize(@type)
  end
end

# frozen_string_literal: true

# Controls the game's rook
class Rook
  def initialize(location)
    @location = location
  end

  def move(new_loc)
    if (new_loc[0] == @location[0]) ^ (new_loc[1] == @location[1])
      @location = new_loc
      return true
    end
    false
  end
end

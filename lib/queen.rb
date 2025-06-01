# frozen_string_literal: true

# Controls the queen
class Queen
  attr_accessor :location, :type

  def initialize(location, type)
    @location = location
    @type = type
  end

  def move(new_location)
    if (new_location[0] == @location[0]) ^ (new_location[1] == @location[1])
      return move_straight(new_location)
    elsif (@location[0] - new_location[0]).abs == (@location[1] - new_location[1]).abs
      return move_diag(new_location)
    end

    false
  end

  def move_diag(new_location)
    unless block_given?
      @location = new_location
      return true
    end
    counter = -1
    if @location[0] < new_location[0] && @location[1] < new_location[1]
      until @location == new_location
        @location[0] += 1
        @location[1] += 1
        counter += 1
        yield @location, counter
      end
    elsif @location[0] < new_location[0] && @location[1] > new_location[1]
      until @location == new_location
        @location[0] += 1
        @location[1] -= 1
        counter += 1
        yield @location, counter
      end
    elsif @location[0] > new_location[0] && @location[1] > new_location[1]
      until @location == new_location
        @location[0] -= 1
        @location[1] -= 1
        counter += 1
        yield @location, counter
      end
    elsif @location[0] > new_location[0] && @location[1] < new_location[1]
      until @location == new_location
        @location[0] -= 1
        @location[1] += 1
        counter += 1
        yield @location, counter
      end
    end
    true
  end

  def move_straight(new_loc)
    if new_loc[0] == @location[0]
      until @location == new_loc
        new_loc[1] > @location[1] ? @location[1] += 1 : @location[1] -= 1
        yield @location if block_given?
      end
    elsif new_loc[1] == @location[1]
      until @location == new_loc
        new_loc[0] > @location[0] ? @location[0] += 1 : @location[0] -= 1
        yield @location if block_given?
      end
    end
    true
  end

  def to_s
    'Q'.colorize(@type)
  end
end

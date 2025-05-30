# frozen_string_literal: true

# Controls the game's rook
class Rook
  attr_accessor :location, :type

  def initialize(location, type)
    @location = location
    @type = type
  end

  def move(new_loc) # rubocop:disable Metrics/MethodLength
    if new_loc[0] == @location[0]
      until @location == new_loc
        new_loc[1] > @location[1] ? @location[1] += 1 : @location[1] -= 1
        yield @location if block_given?
      end
      return true
    elsif new_loc[1] == @location[1]
      until @location == new_loc
        new_loc[0] > @location[0] ? @location[0] += 1 : @location[0] -= 1
        yield @location if block_given?
      end
      return true
    end
    false
  end

  def to_s
    'R'.colorize(@type)
  end
end

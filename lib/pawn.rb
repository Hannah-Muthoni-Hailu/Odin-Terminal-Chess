# frozen_string_literal: true

require 'colorize'

# Controls the pawn on the board
class Pawn
  attr_accessor :location, :type

  def initialize(location, type)
    @location = location
    @type = type
    @no_of_moves = 0
  end

  def move(new_loc)
    # Check that the move is in the same column
    return false unless new_loc[0] == @location[0]

    # Check that the move is only one step forward
    # or is 2 steps forward if number of moves is zero
    if (@no_of_moves.zero? && new_loc[1] == @location[1] + 2) || new_loc[1] == @location[1] + 1
      until @location == new_loc
        @location[1] += 1
        yield @location if block_given?
      end
      @no_of_moves += 1
      true
    else
      false
    end
  end

  def eat(target)
    if (target[1] == @location[1] + 1) && (target[0] == @location[0] - 1 || target[0] == @location[0] + 1)
      until @location == target
        @location[1] += 1
        target[0] == @location[0] - 1 ? (@location[0] -= 1) : (@location[0] += 1)
        yield @location if block_given?
      end
      @location = target
      @no_of_moves += 1
      return true
    end
    false
  end

  def to_s
    'P'.colorize(@type)
  end
end

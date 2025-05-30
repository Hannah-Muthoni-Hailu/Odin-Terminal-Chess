# frozen_string_literal: true

# Controls the bishop
class Bishop
  attr_accessor :location, :type

  def initialize(location, type)
    @location = location
    @type = type
  end

  def move(new_location) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    if (@location[0] - new_location[0]).abs == (@location[1] - new_location[1]).abs
      unless block_given?
        @location = new_location
        return true
      end
      # When moving to the top right
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
      return true
    end
    false
  end

  def to_s
    'B'.colorize(@type)
  end
end

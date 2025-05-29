# frozen_string_literal: true

# Controls the knight
class Knight
  def initialize(location, type)
    @location = location
    @type = type
  end

  def move(new_location)
    if find_children(@location).include? new_location
      @location = new_location
      return true
    end
    false
  end

  def find_children(node) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    children = []
    children.push([node[0] + 1, node[1] + 2]) unless node[0] + 1 > 7 || node[1] + 2 > 7
    children.push([node[0] + 2, node[1] + 1]) unless node[0] + 2 > 7 || node[1] + 1 > 7
    children.push([node[0] + 2, node[1] - 1]) unless node[0] + 2 > 7 || (node[1] - 1).negative?
    children.push([node[0] + 1, node[1] - 2]) unless node[0] + 1 > 7 || (node[1] - 2).negative?
    children.push([node[0] - 1, node[1] - 2]) unless (node[0] - 1).negative? || (node[1] - 2).negative?
    children.push([node[0] - 2, node[1] - 1]) unless (node[0] - 2).negative? || (node[1] - 1).negative?
    children.push([node[0] - 2, node[1] + 1]) unless (node[0] - 2).negative? || node[1] + 1 > 7
    children.push([node[0] - 1, node[1] + 2]) unless (node[0] - 1).negative? || node[1] + 2 > 7
    children
  end

  def to_s
    'N'.colorize(@type)
  end
end

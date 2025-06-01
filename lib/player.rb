# frozen_string_literal: true

# Controls the player
class Player
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def make_move # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    p 'Select the piece you want to move'
    p 'The first value represents the vertical values and the second represents horizontal values'
    p 'Enter \'C\' if you have a checkmate'
    move = gets.chomp.split(',')

    move.map!(&:strip).map! do |val|
      return 'Check Mate' if val.downcase == 'c'
      return 'Invalid input' unless val.to_i.to_s == val && val.to_i < 7

      val.to_i
    end
    return 'Invalid input' if move.length != 2

    p 'Select the location you want to move the piece to'
    target = gets.chomp.split(',')

    target.map!(&:strip).map! do |val|
      return 'Check Mate' if val.downcase == 'c'
      return 'Invalid input' unless val.to_i.to_s == val && val.to_i < 7

      val.to_i
    end
    return 'Invalid input' if target.length != 2

    [move, target]
  end
end

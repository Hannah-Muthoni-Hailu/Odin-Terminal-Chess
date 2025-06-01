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
    move = gets.chomp.split(',').map!(&:strip).map do |val|
      return 'Check Mate' if val.downcase == 'c'
      return 'Invalid input' unless val.to_i.to_s == val && val.to_i < 7

      val.to_i
    end

    p 'Select the location you want to move the piece to'
    target = gets.chomp.split(',').map!(&:strip).map do |val|
      return 'Check Mate' if val.downcase == 'c'
      return 'Invalid input' unless val.to_i.to_s == val && val.to_i < 7

      val.to_i
    end

    [move, target]
  end
end

player = Player.new(:black)
p player.make_move

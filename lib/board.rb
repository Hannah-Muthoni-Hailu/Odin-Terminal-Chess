# frozen_string_literal: true

require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'

# Controls the main chess board
class Board
  attr_accessor :board

  def initialize
    @board = setup
  end

  def setup
    board = []

    7.times do
      board.push(Array.new(7, ' '))
    end

    board = place_pieces(board)
  end

  def place_pieces(board)
    board = place_pawns(board)

    board = place_rooks(board)

    board = place_knights(board)

    board = place_bishops(board)

    place_royals(board)
  end

  def place_pawns(board)
    # Create pawns
    counter = 0

    7.times do
      pawn_black = Pawn.new([1, counter], :black)
      pawn_white = Pawn.new([5, counter], :white)

      board[1][counter] = pawn_black
      board[5][counter] = pawn_white
      counter += 1
    end

    board
  end

  def place_rooks(board)
    # Create and place rooks
    rooks = [[0, 0], [0, 6], [6, 0], [6, 6]]

    rooks[0...2].each do |index|
      board[index[0]][index[1]] = Rook.new([index], :black)
    end

    rooks[2...].each do |index|
      board[index[0]][index[1]] = Rook.new([index], :white)
    end

    board
  end

  def place_knights(board)
    # Create and place knights
    knights = [[0, 1], [0, 5], [6, 1], [6, 5]]

    knights[0...2].each do |index|
      board[index[0]][index[1]] = Knight.new([index], :black)
    end

    knights[2...].each do |index|
      board[index[0]][index[1]] = Knight.new([index], :white)
    end

    board
  end

  def place_bishops(board)
    # Create and place bishops
    bishops = [[0, 2], [0, 4], [6, 2], [6, 4]]

    bishops[0...2].each do |index|
      board[index[0]][index[1]] = Bishop.new([index], :black)
    end

    bishops[2...].each do |index|
      board[index[0]][index[1]] = Bishop.new([index], :white)
    end

    board
  end

  def place_royals(board)
    # Place king and queen
    board[0][3] = King.new([0, 3], :black)
    board[6][3] = King.new([6, 3], :white)

    board[0][4] = King.new([0, 4], :black)
    board[6][4] = King.new([6, 4], :white)

    board
  end

  
end

board = Board.new
board.board.each do |arr|
  p arr
end

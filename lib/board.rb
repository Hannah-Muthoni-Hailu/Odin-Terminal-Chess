# frozen_string_literal: true

require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'

# Controls the main chess board
class Board
  attr_accessor :board, :pieces

  def initialize
    @pieces = []
    @board = setup
  end

  def setup
    place_pieces
    board = []

    7.times do
      board.push(Array.new(7, ' '))
    end

    @pieces.each do |piece|
      board[piece.location[0]][piece.location[1]] = piece
    end
    board
  end

  def place_pieces
    create_pawns
    create_rooks
    create_knights
    create_bishops
    create_royals
  end

  def create_pawns
    counter = 0

    7.times do
      pawn_black = Pawn.new([1, counter], :black)
      pawn_white = Pawn.new([5, counter], :white)

      @pieces.push(pawn_black)
      @pieces.push(pawn_white)
      counter += 1
    end
  end

  def create_rooks
    rooks = [[0, 0], [0, 6], [6, 0], [6, 6]]
    rooks[0...2].each do |rook|
      @pieces.push(Rook.new(rook, :black))
    end

    rooks[2...].each do |rook|
      @pieces.push(Rook.new(rook, :white))
    end
  end

  def create_knights
    # Create and place knights
    knights = [[0, 1], [0, 5], [6, 1], [6, 5]]

    knights[0...2].each do |index|
      @pieces.push(Knight.new(index, :black))
    end

    knights[2...].each do |index|
      @pieces.push(Knight.new(index, :white))
    end
  end

  def create_bishops
    # Create and place bishops
    bishops = [[0, 2], [0, 4], [6, 2], [6, 4]]

    bishops[0...2].each do |index|
      @pieces.push(Bishop.new(index, :black))
    end

    bishops[2...].each do |index|
      @pieces.push(Bishop.new(index, :white))
    end
  end

  def create_royals
    # Place king and queen
    @pieces.push(King.new([0, 3], :black))
    @pieces.push(King.new([6, 3], :white))

    @pieces.push(Queen.new([0, 4], :black))
    @pieces.push(Queen.new([6, 4], :white))
  end

  def display
    puts ' :  0 1 2 3 4 5 6'

    @board.each_with_index do |arr, index|
      puts "#{index}: |#{arr.join('|')}"
    end
  end

  def play(piece_loc, target_loc)
    piece = @board[piece_loc[0]][piece_loc[1]]
    if !@board[target_loc[0]][target_loc[1]].is_a?(String) && (@board[target_loc[0]][target_loc[1]].type == piece.type)
      return 'Invalid move'
    end

    res = move(piece, target_loc)

    return 'Invalid move' unless res

    @board[piece.location[0]][piece.location[1]] = piece
    @board[piece_loc[0]][piece_loc[1]] = ' '
  end

  def move(piece, target_loc)
    # Check if piece is moving or eating
    if @board[target_loc[0]][target_loc[1]] != ' '
      # Piece is eating
      res = if piece.is_a?(Pawn)
              piece.eat(target_loc) do |loc|
                return 'Invalid move!' if @board[loc[0]][loc[1]] != ' ' && loc != target_loc
              end
            else
              piece.move(target_loc) do |loc|
                return 'Invalid move!' if @board[loc[0]][loc[1]] != ' ' && loc != target_loc
              end
            end

      @board[target_loc[0]][target_loc[1]] = ' '
    else
      res = piece.move(target_loc) do |loc|
        return 'Invalid move!' if @board[loc[0]][loc[1]] != ' ' && loc != target_loc
      end
    end
    res
  end

  def check; end
end

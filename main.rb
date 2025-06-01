# frozen_string_literal: true;

require_relative 'lib/board'
require_relative 'lib/player'

def setup
  board = Board.new
  player_white = Player.new(:white)
  player_black = Player.new(:black)

  [board, player_white, player_black]
end

def play_game
  board, player_white, player_black = setup

  player = player_white

  loop do
    board.display

    res = player.make_move

    if res == 'Invalid input'
      p "Invalid input. Please player #{player.type} re-enter input"
      return
    elsif res == 'Check Mate'
      p "Congratulations player #{player.type}. You won"
      return
    else
      move, target = res

      play = board.play(move, target)

      if play == 'Invalid move'
        p "Invalid input. Please player #{player.type} re-enter input"
      else
        player = player == player_white ? player_black : player_white
      end
    end
  end
end

play_game

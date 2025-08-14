# frozen_string_literal: true

require_relative 'board'
require_relative 'player_input'
class Game
  attr_reader :player_one, :player_two, :current_player

  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]
  ].freeze

  def initialize(board, player_one, player_two)
    @board = board
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
  end

  def start_game
    while @board.board.include?(' ')
      @board.display_board
      position = @board.valid_position?
      @board.mark_board(current_player.symbol, position)
      break if game_won?

      next_player
    end
  end

  def next_player
    return @current_player = player_two if @current_player == player_one

    @current_player = player_one
  end

  def game_won?
    WINNING_COMBINATIONS.each do |combo|
      if winning_line?(combo)
        puts "#{@current_player.name} wins!"
        return true
      end
    end
    false
  end

  def winning_line?(combo)
    win = []
    win.push(@board.board[combo[0]])
    win.push(@board.board[combo[1]])
    win.push(@board.board[combo[2]])
    all_equal?(win)
  end

  def all_equal?(arr)
    arr.uniq.size == 1 && arr.uniq != [' ']
  end
end

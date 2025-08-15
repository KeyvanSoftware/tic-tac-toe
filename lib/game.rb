# frozen_string_literal: true

require_relative 'board'
require_relative 'player_input'
class Game
  attr_reader :player_one, :player_two, :current_player

  def initialize(board, player_one, player_two)
    @board = board
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
  end

  def start_game
    while @board.empty_positions?
      @board.display_board
      position = @board.valid_position?
      @board.mark_board(current_player.symbol, position)
      if @board.game_won?
        puts "#{@current_player.name} wins!"
        break
      end

      next_player
    end
  end

  def next_player
    return @current_player = player_two if @current_player == player_one

    @current_player = player_one
  end
end

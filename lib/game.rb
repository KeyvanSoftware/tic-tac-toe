# frozen_string_literal: true
require_relative 'helper'
class Game
  include Helpers
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
      position = symbol_position
      @board.mark_board(current_player.symbol, position)
      # break if game_won?

      next_player
    end
  end

  def next_player
    return @current_player = player_two if @current_player == player_one

    @current_player = player_one
  end

  def game_won?
    WINNING_COMBINATIONS.each do |arr|
      @board.board.values_at(*arr).all? do |symbol|
        symbol == 'x' || symbol == 'o'
      end
    end
  end

end

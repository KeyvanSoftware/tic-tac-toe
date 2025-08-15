# frozen_string_literal: true

require_relative 'player_input'
class Board
  attr_reader :board

  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]
  ].freeze

  VALID_SYMBOLS = %w[x o].freeze
  VALID_POSITIONS = (0..8).to_a.freeze

  def initialize
    @board = Array.new(9, ' ')
  end

  def mark_board(symbol, position)
    @board[position] = symbol
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts ''
  end

  def valid_position?
    loop do
      position = PlayerInput.symbol_position
      if valid_range?(position) && position_empty?(position)
        return position
      elsif !valid_range?(position)
        warn_invalid_range
      else
        warn_position_taken
      end
    end
  end

  def game_won?
    WINNING_COMBINATIONS.each do |combo|
      return true if winning_line?(combo)
    end
    false
  end

  def winning_line?(combo)
    win = []
    win.push(board[combo[0]])
    win.push(board[combo[1]])
    win.push(board[combo[2]])
    all_equal?(win)
  end

  def all_equal?(arr)
    arr.uniq.size == 1 && arr.uniq != [' ']
  end

  def empty_positions?
    board.include?(' ')
  end

  private

  def valid_range?(position)
    VALID_POSITIONS.include?(position)
  end

  def position_empty?(position)
    @board[position] == ' '
  end

  def warn_invalid_range
    puts 'Invalid position number, numbers must be between 0-8'
  end

  def warn_position_taken
    puts 'Invalid position, pick an empty position'
  end
end

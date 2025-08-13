# frozen_string_literal: true

# board class
class Board
  attr_reader :board

  VALID_SYMBOLS = %w[x o].freeze
  VALID_POSITIONS = (0..8).to_a.freeze

  def initialize
    @board = Array.new(9, ' ')
  end

  def mark_board(symbol, position)
    @board[position] = symbol
    display_board
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
      position = symbol_position
      if valid_range?(position) && position_empty?(position)
        return position
      elsif !valid_range?(position)
        warn_invalid_range
      else
        warn_position_taken
      end
    end
  end

  private

  def valid_range?(position)
    VALID_POSITIONS.include?(position)
  end

  def position_empty?(position)
    @board[position] == ' '
  end

  def warn_invalid_range
    puts 'Invalid position number, numbers must be between 0-9'
  end

  def warn_position_taken
    puts 'Invalid position, pick an empty position'
  end
end

# my_board = Board.new
# my_board.mark_board('x', 0)
# my_board.mark_board('o', 1)
# my_board.mark_board('o', 2)
# my_board.mark_board('o', 3)
# my_board.mark_board('x', 4)
# my_board.mark_board('o', 5)
# my_board.mark_board('o', 6)
# my_board.mark_board('x', 7)
# my_board.mark_board('x', 8)
# my_board.display_board

# use enums for x and o
# initialise an empty board (3x3 grid) (probably an array)
# display the board (maybe have numbers in cells) -> method
# mark a grid with either x or o if empty- method
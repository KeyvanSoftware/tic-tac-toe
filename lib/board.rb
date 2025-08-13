# frozen_string_literal: true

require_relative 'helper'
class Board
  include Helpers
  attr_reader :board

  VALID_SYMBOLS = %w[x o].freeze
  VALID_POSITIONS = (0..8).to_a.freeze

  def initialize
    # @board = Array.new(9, ' ')
    @board = ['x', 'x', 'x', ' ', ' ', ' ', ' ', ' ', ' ']
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
    puts 'Invalid position number, numbers must be between 0-8'
  end

  def warn_position_taken
    puts 'Invalid position, pick an empty position'
  end
end

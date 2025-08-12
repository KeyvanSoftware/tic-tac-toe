# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/helper'
include Helpers

board = Board.new
name = player_name('Player one')
player_one = Player.new(name, 'x')
name = player_name('Player two')
player_two = Player.new(name, 'o')
game = Game.new(board, player_one, player_two)
game.start_game

# name = 'joe'
# player_one = Player.new(name, 'x')

# name = 'shmoe'
# player_two = Player.new(name, 'o')
# game = Game.new(board, player_one, player_two)
# # ---------------------------------------------------
# puts 'Pick a position'
# # position = gets.chomp.to_i
# position = 3
# board.mark_board(player_one.symbol, position)

# puts game.current_player
# game.next_player

# while board.board.include?(' ')
#   puts 'Pick a position: '
#   position = gets.chomp.to_i
#   board.mark_board(game.current_player.symbol, position)
#   game.next_player
# end
# create one board instance
# create two player instances
# - Player one, what is your name?
# - Player two, what is your name?
# while game not won or board not filled (no whitespace in array)
# - pick a position
# - switch player
# - repeat
 
# winning condition

# if indexes 0,1,2 are equal
# if indexes 3,4,5 are equal
# if indexes 6,7,8 are equal
# if indexes 0,3,6 are equal
# if indexes 1,4,7 are equal
# if indexes 2,5,8 are equal
# if indexes 0,4,8 are equal
# if indexes 6,4,2 are equal
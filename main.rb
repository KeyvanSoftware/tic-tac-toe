# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player_input'

board = Board.new

name = PlayerInput.player_name('Player one')
player_one = Player.new(name, 'x')
name = PlayerInput.player_name('Player two')
player_two = Player.new(name, 'o')

game = Game.new(board, player_one, player_two)
game.start_game

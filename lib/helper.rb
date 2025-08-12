# frozen_string_literal: true

module Helpers
  def player_name(player_number)
    puts "#{player_number}, what is your name?"
    gets.chomp
  end

  def symbol_position
    puts 'Pick a position'
    gets.chomp.to_i
  end
end

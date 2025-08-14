# frozen_string_literal: true

class PlayerInput
  def self.player_name(player_number)
    puts "#{player_number}, what is your name?"
    gets.chomp
  end

  def self.symbol_position
    puts 'Pick a position'
    begin
      input = gets.chomp
      Integer(input)
    rescue ArgumentError
      puts 'Enter a valid number'
      retry
    end
  end
end

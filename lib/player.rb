# frozen_string_literal: true

# player class
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def to_s
    name.to_s
  end
end

# two players must be created
# player1 marks grid
# players switch
# player2 marks grid
# repeat until game is won or no viable moves
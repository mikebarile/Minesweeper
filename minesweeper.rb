require_relative 'player'
require_relative 'board'
require_relative 'tile'

class Minesweeper
  attr_accessor :board
  def initialize(board = Array.new(9){Array.new(9)})
    @board = board
    populate_bombs(@board)
  end

  def flag_bomb()

  end

  def populate_bombs(board)

  end

  def reveal_square()

  end

  def take_turn()

  end

end

require_relative 'player'
require_relative 'board'
require_relative 'tile'

class Minesweeper

  def initialize(board = Array.new(9){Array.new(9)})
    @board = board
    populate_bombs(@board)
  end

  def run
    take_turn until over?
    end_game
  end

  def take_turn
  end

  def over?

  end

  def end_game
  end
end

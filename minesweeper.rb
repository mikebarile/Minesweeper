require_relative 'player'
require_relative 'board'
require_relative 'tile'

class Minesweeper

  def initialize
    @board = Board.new
    @player = Player.new
  end

  def run
    take_turn until over?
    end_game
  end

  def take_turn
    @board.render
    input = @player.get_input
  end

  def over?
    @board.won? || @board.lost?
  end

  def end_game
  end
end

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
    pos = player.get_pos(board)
    action = player.get_action(pos, board)
    action == "F" ? flip_tile(pos) : mark_tile(pos)
  end

  def flip_tile(pos)
    @board[pos].flip!
  end

  def mark_tile(pos)
    @board[pos].mark!
  end

  def over?
    @board.won? || @board.lost?
  end

  def end_game
    @board.render
    #do stuff
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.render
end

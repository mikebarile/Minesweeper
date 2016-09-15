require 'colorize'
require 'byebug'
require_relative 'player'
require_relative 'board'
require_relative 'tile'

class Minesweeper

  def initialize
    @player = Player.new
  end

  def run
    create_board
    take_turn until over?
    end_game
  end

  def create_board
    p "Enter a grid size between 3 and 20."
    size = gets.chomp.to_i
    until size.is_a?(Integer) && size > 0 && size < 20
      p "Invalid entry: enter an integer between 3 and 20"
      size = gets.chomp
    end
    @board = Board.new(size)
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
    debugger
    @board.lost? || @board.won?
  end

  def end_game
    @board.render
    p @board.won? ? "Congratulations, you won!" : "You suck!"
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Minesweeper.new
  g.run
end

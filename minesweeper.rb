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
    pos = @player.get_pos(@board)
    action = @player.get_action(pos, @board)
    action == "F" ? flip_tile(pos) : mark_tile(pos)
  end

  def flip_tile(pos)
    result = @board[pos].flip!
    if result == 0
      flip_cascade(pos)
    end
  end

  def flip_cascade(pos)
    flip_horizontal(pos)
    flip_vertical(pos)
    flip_diagonal(pos)
  end

  def flip_horizontal(pos)
    row,col = pos
    flip_tile([row, col-1]) unless col == 0 ||
      @board[[row, col-1]].is_flipped?
    flip_tile([row, col+1]) unless col == @board.grid_size-1 ||
      @board[[row, col+1]].is_flipped?
  end

  def flip_vertical(pos)
    row,col = pos
    flip_tile([row-1,col]) unless row == 0 ||
      @board[[row-1, col]].is_flipped?
    flip_tile([row+1,col]) unless row == @board.grid_size-1 ||
      @board[[row+1, col]].is_flipped?
  end

  def flip_diagonal(pos)
    row,col = pos
    flip_horizontal([row+1,col]) unless row == @board.grid_size-1
    flip_horizontal([row-1,col]) unless row == 0
  end

  def pos_in_bounds?(pos)
    row, col = pos
    return false if row < 0 || row >= @board.grid_size
    return false if col < 0 || col >= @board.grid_size
    true
  end

  def mark_tile(pos)
    @board[pos].mark!
  end

  def over?
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

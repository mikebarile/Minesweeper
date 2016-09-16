require 'colorize'
class Board
  attr_reader :grid_size

  def initialize(grid_size = 9)
    @grid = Array.new(grid_size) {Array.new(grid_size){0}}
    @grid_size = grid_size
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos,val)
    @grid[pos[0]][pos[1]] = val
  end

  def populate_grid(pos)
    seed_bombs(pos)
    populate_values
    create_tiles
  end

  def seed_bombs(guess)
    num_bomb = 0
    until num_bomb == @grid.length + 1
      pos = [rand(@grid.length), rand(@grid.length)]
      unless self[pos] == :x || pos == guess
        self[pos] = :x
        num_bomb += 1
      end
    end
  end

  def populate_values
    @grid.each_with_index do |row, row_idx|
      row.map!.with_index do |el, col_idx|
        determine_cell_value([row_idx, col_idx])
      end
    end
  end

  def determine_cell_value(pos)
    return :x if self[pos] == :x
    check_horizontal(pos) + check_vertical(pos) + check_diagonal(pos)
  end

  def check_horizontal(pos)
    row,col = pos
    num_bombs = 0
    num_bombs +=1 if col != 0 && self[[row,col-1]] == :x
    num_bombs +=1 if col != @grid.length-1 && self[[row,col+1]] == :x
    num_bombs
  end

  def check_vertical(pos)
    row,col = pos
    num_bombs = 0
    num_bombs +=1 if row != 0 && self[[row-1,col]] == :x
    num_bombs +=1 if row != @grid.length-1 && self[[row+1,col]] == :x
    num_bombs
  end

  def check_diagonal(pos)
    row,col = pos
    num_bombs = 0
    #use check horizontal above and below
    num_bombs += check_horizontal([row+1,col]) unless row == @grid.length-1
    num_bombs += check_horizontal([row-1,col]) unless row == 0
    num_bombs
  end

  def create_tiles
    @grid.each  {|row| row.map! {|el| Tile.new(el)}}
  end

  def render
    puts "  #{(0...@grid.length).to_a.join(" ").colorize(:white)}"
    @grid.each_with_index do |row, i|
      puts "#{i.to_s.colorize(:white)} #{row.map(&:to_s).join(" ")}"
    end
  end

  def won?
    won = true
    @grid.each do |row|
      row.each do |el|
        won = false if !el.is_flipped? && !el.is_bomb?
      end
    end
    won
  end

  def lost?
    lost = false
    @grid.each do |row|
      row.each do |el|
        lost = true if el.is_flipped? && el.is_bomb?
      end
    end
    lost
  end
end

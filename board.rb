class Board

  def initialize(grid_size = 9)
    @grid = Array.new(grid_size) {Array.new(grid_size)}
    populate_grid
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos,val)
    @grid[pos[0]][pos[1]] = val
  end

  def populate_grid
    seed_bombs
    populate_values
    create_tiles
  end

  def seed_bombs
    num_bomb = 0
    until num_bomb == @grid.length + 1
      pos = [rand(@grid.length), rand(@grid.length)]
      unless @grid[pos] == :x
        @grid[pos] = :x
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
  end

  def check_vertical(pos)
    row,col = pos
    num_bombs = 0
    num_bombs +=1 if row != 0 && self[[row-1,col]] == :x
    num_bombs +=1 if row != @grid.length-1 && self[[row+1,col]] == :x
  end

  def check_diagonal(pos)
    #use check horizontal above and below
  end

  def create_tiles

  end

end

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
    adj_bombs = check_horizontal(pos) + check_vertical(pos) +
      check_diagonal(pos)
  end

  def check_horizontal
  end

  def check_vertical
  end

  def check_diagonal
  end

  def create_tiles

  end

end

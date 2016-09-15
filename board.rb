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
  end

  def seed_bombs
    num_bomb = grid_size+1
    until num_bomb == 0
      x = rand(@grid.length)
      y = rand(@grid.length)
      if @grid[]
    end
  end

  def populate_values
  end

end

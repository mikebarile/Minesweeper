class Player

  def initialize
  end

  def get_pos(board)
    p "Player, enter the position for your next move. (e.g. row,col)"
    pos = gets.chomp.split(",").map(&:to_i)
    until valid_pos?(pos, board)
      p "Invalid position, enter your move in the format 'row,col'."
      pos = gets.chomp.split(",").map(&:to_i)
    end
    pos
  end

  def valid_pos?(pos, board)
    pos_in_bounds?(pos, board) && pos_abides_rules?(pos, board)
  end

  def pos_in_bounds?(pos, board)
    return false if pos.length != 2
    row, col = pos
    return false if row < 0 || row >= board.grid_size
    return false if col < 0 || col >= board.grid_size
    true
  end

  def pos_abides_rules?(pos, board)
    !@board[pos].is_flipped?
  end

  def get_action(pos, board)
    p "Player, enter an action: 'F' for flip and 'M' for mark bomb."
    action = gets.chomp
    until valid_action?(pos, action, board)
      p "Invalid action, enter an action 'F' or 'M'."
      action = gets.chomp
    end
    action
  end

  def valid_action?(pos, action, board)
    if board[pos].is_marked? && action == "F"
      p "Can't flip a marked tile! Yout must first unmark it using 'M'."
      return false
    end
    action == "F" || action == "M"
  end
end

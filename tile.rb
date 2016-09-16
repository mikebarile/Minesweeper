require 'colorize'

class Tile
  def initialize(value)
    @value = value
    @flipped = false
    @marked = false
  end

  def flip!
    if @flipped == false
      @flipped = true
      @value
    else
      raise 'Cannot flip a previously flipped tile!'
    end
  end

  def mark!
    @marked = !@marked
  end

  def is_flipped?
    @flipped
  end

  def is_bomb?
    @value == :x
  end

  def is_marked?
    @marked
  end

  def to_s
    if @flipped
      return " " if @value == 0
      @value == :x ? "X".colorize(:red) : @value.to_s.colorize(:light_blue)
    elsif @marked
      "?".colorize(:yellow)
    else
      "*".colorize(:green)
    end
  end
end

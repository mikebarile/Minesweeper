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
      @value == :x ? "X" : @value.to_s
    elsif @marked
      "?"
    else
      "*"
    end
  end
end

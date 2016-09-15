class Tile

  def initialize(value)
    @value = value
    @flipped = false
    @marked = false
  end

  def flip!
    if @flipped == false
      @fliped = true
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
    value == :x
  end

  def to_s
    if @flipped
      @value.to_s == :x ? "X" : @value.to_s
    elsif @marked
      "?"
    else
      "*"
    end
  end
end

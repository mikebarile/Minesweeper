class Tile

  def initialize(value = " ")
    @value = value
    @flipped = false
    @marked = false
    if value == :x
      @bomb_flag = true
    else
      @bomb_flag = false
    end
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

  def to_s
    if @flipped
      @value.to_s
    elsif @marked
      "?"
    else
      "*"
    end
  end
end

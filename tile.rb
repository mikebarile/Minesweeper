class Tile

  def initialize(value = "")
    @value = value
    @flipped = false
    @marked = false
    if value == :b
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
    @value.to_s
  end

end

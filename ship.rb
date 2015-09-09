class Ship
  attr_reader :length


  def initialize(length)
    @length = length
    @positions = []
    @hit_counter = []
  end

  def place(x,y, horizontal)
    return false unless @positions.empty?
    if horizontal
      (x...x + @length).each do |i|
        @positions << [i, y]
    end
    else
      (y...y + @length).each do |j|
        @positions << [x, j]
    end
    # return false if @placed
    # @placed = true
    # @horizontal = horizontal
    # @x = x
      # @y = y
    end
  end

  def covers?(x,y)
    @positions.include?([x,y])
    # @horizontal ? (@x...@x+@length).include?(x) && @y == y : (@y...@y+@length).include?(y) && @x == x
  end

  def overlaps_with?(other_ship)
    @positions.each do |place|
      return true if other_ship.covers?(place[0], place[1])
    end
    false
  end

  def fire_at(x,y)
    if covers?(x,y) && !@hit_counter.include?([x, y])
      @hit_counter << [x, y]
    end
  end

  def sunk?
    @hit_counter.length == @length
  end
end
#   def has_ship_on?(x,y)
#
#   end
#
# end

class InfinitePlane
  def initialize(x, y)
    @x = x
    @y = y
  end

  def x=(value)
    @x = value
  end

  def x
    @x
  end

  def y=(value)
    @y = value
  end

  def y
    @y
  end

  def to_a
    [] << x << y
  end

  def move_to_directions(directions)
    directions.chars.each do |dir|
      if dir == "^"
        @y = @y - 1
      elsif dir == "v"
        @y = @y + 1
      elsif dir == ">"
        @x = @x + 1
      else
        @x = @x - 1
      end
    end
  end
end

point = InfinitePlane.new(0, 0)
point.move_to_directions ">>>>^^^^"
p point.to_a

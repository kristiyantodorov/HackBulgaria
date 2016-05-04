class Vector2D
  def initialize(x, y)
    @x, @y = x, y
  end

  def x
    @x
  end

  def x=(value)
    @x = value
  end

  def y
   @y 
  end

  def y=(value)
    @y = value
  end

  def length
    (x * x + y * y) ** 0.5
  end

  def normalize
    denom = length
    @x = @x / denom
    @y = @y / denom
    self
  end

  def ==(other)
    x == other.x and y == other.y
  end

  def +(other)
    Vector2D.new(x + other.x, y + other.y)
  end

  def -(other)
    Vector2D.new(x - other.x, y - other.y)
  end

  def *(scalar)
    Vector2D.new(x * scalar, y * scalar)
  end

  def /(scalar)
    Vector2D.new(x / scalar, y / scalar)
  end

  def to_s
    "(#{x}, #{y})"
  end
end

class Vector
  def initialize(*components)
    @x, @y, @z = components
  end

  def dimension

  end

  def length
    # Your code goes here.
  end

  def normalize
    # Your code goes here.
  end

  def [](index)
    # Your code goes here.
  end

  def []=(index, value)
    # Your code goes here.
  end

  def ==(other)
    # Your code goes here.
  end

  def +(vector_of_same_dimension_or_scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def -(vector_of_same_dimension_or_scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def *(scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def /(scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def dot(vector_of_same_dimension_or_scalar)
    # Return the dot product of the two vectors
    # https://en.wikipedia.org/wiki/Dot_product#Algebraic_definition
  end

  def to_s
    # Your code goes here.
  end
end


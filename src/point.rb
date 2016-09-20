class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # Overloading addition oeprator
  def +(other)
    Point.new(
      @x + other.x,
      @y + other.y
    )
  end

  def pos
    [@x, @y]
  end

  def to_s
    "#{@x},#{@y}"
  end
end

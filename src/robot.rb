class Robot
  attr_accessor :point, :direction

  def initialize
    @point = Point.new(0, 0)
    @direction = North.new
  end

  def direction=(new_direction)
    unless Direction::DELTA.include?(new_direction)
      raise "Unknown direction => #{new_direction}"
    end
    @direction.delta_point = Direction::DELTA[new_direction]
  end

  def point=(point)
    @point.x = point.x
    @point.y = point.y
  end

  def turn(side)
    @direction.send(side)
  end

  def to_s
    "#{@point},#{@direction}"
  end
end

class TableTop
  attr_reader :size, :robot, :placed
  def initialize(max_x, max_y)
    @size = Point.new(max_x, max_y)
    @robot = Robot.new
  end

  def place(x, y, direction)
    @placed = true
    new_point = Point.new(x, y)
    return unless within_limits?(new_point)
    @robot.point = new_point
    @robot.direction = direction
  end

  def move
    return unless placed?
    new_point = @robot.point + @robot.direction.delta_point
    @robot.point = new_point if within_limits?(new_point)
  end

  def turn(side)
    return unless placed?
    @robot.turn(side)
  end

  def invalid(command)
    (@invalid ||= []) << command
  end

  def report
    return unless placed?
    puts "Output: #{@robot}"
  end

  def within_limits?(new_point)
    new_point.x >= 0 && new_point.y >= 0 &&
      new_point.x < @size.x && new_point.y < @size.y
  end

  def placed?
    @placed
  end
end

class RobotTest < Minitest::Test
  def test_turn_robot
    robot = Robot.new
    robot.turn(:left)
    assert robot.direction.direction == :west
    robot.turn(:right)
    assert robot.direction.direction == :north
  end

  def test_robot_direction_assignment
    robot = Robot.new
    robot.direction = :west
    assert robot.direction.direction == West.new.direction
  end
end

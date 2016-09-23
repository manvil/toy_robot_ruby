class DirectionTest < Minitest::Test
  def test_turn_left
    assert North.new.left == :west
    assert West.new.left == :south
    assert South.new.left == :east
    assert East.new.left == :north
  end

  def test_turn_right
    assert North.new.right == :east
    assert West.new.right == :north
    assert South.new.right == :west
    assert East.new.right == :south
  end

  def test_move_point
    point = Point.new(0, 0)
    assert North.new.move(point).pos == North.new.delta_point.pos
    assert West.new.move(point).pos == West.new.delta_point.pos
    assert South.new.move(point).pos == South.new.delta_point.pos
    assert East.new.move(point).pos == East.new.delta_point.pos
  end
end

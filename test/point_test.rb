class PointTest < Minitest::Test
  def test_point_addition
    p1 = Point.new(1, 2)
    p2 = Point.new(3, 4)
    assert (p1 + p2).pos == [4, 6]
  end
end

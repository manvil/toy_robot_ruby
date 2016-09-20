class Direction
  # The delta point defines the x and y parameters that has to be added
  # to a point to make a move in that particular direction
  attr_accessor :delta_point

  # Array in clockwise order of the directions
  ORDER = [:north, :west, :south, :east].freeze

  # Delta parameters of each direction
  DELTA = {
    north: [0, 1],
    west: [-1, 0],
    south: [0, -1],
    east: [1, 0]
  }.freeze

  def initialize
    @delta_point = Point.new(*Direction::DELTA[self.class.name.downcase.to_sym])
  rescue => e
    raise "Unknown direction"
  end

  # Move means taking one step in the speicified direction
  def move(point)
    point + @delta_point
  end

  # Choose the (n-1)th element of the array (circular) ORDER
  def right
    ORDER[
      (ORDER.index(
        Direction::DELTA.select { |_k, v| v == @delta_point.pos }.keys.first
      ) - 1) % 4
    ]
  end

  # Choose the (n+1)th element of the array (circular) ORDER
  def left
    ORDER[
      (ORDER.index(
        Direction::DELTA.select { |_k, v| v == @delta_point.pos }.keys.first
      ) + 1) % 4
    ]
  end

  def to_s
    Direction::DELTA.select { |_k, v| v == @delta_point.pos }
                    .keys.first.to_s.upcase
  end
end

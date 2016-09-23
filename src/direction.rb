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
    self.delta_point = Direction::DELTA[self.class.name.downcase.to_sym]
  rescue
    raise 'Unknown direction'
  end

  # Move means taking one step in the speicified direction
  def move(point)
    point + @delta_point
  end

  # Choose the (n-1)th element of the array (circular) ORDER
  def right
    self.delta_point = Direction::DELTA[ORDER[(ORDER.index(direction) - 1) % 4]]
    direction
  end

  # Choose the (n+1)th element of the array (circular) ORDER
  def left
    self.delta_point = Direction::DELTA[ORDER[(ORDER.index(direction) + 1) % 4]]
    direction
  end

  def direction
    Direction::DELTA.select { |_k, v| v == @delta_point.pos }.keys.first
  end

  def to_s
    direction.to_s.upcase
  end

  def delta_point=(value)
    if value.is_a?(Array) && value.length == 2
      @delta_point = Point.new(*value)
    elsif value.is_a?(Point)
      @delta_point = value
    else
      raise 'Invalid Assignement for a point'
    end
    @delta_point
  end
end

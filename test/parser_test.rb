class ParserTest < Minitest::Test
  def test_parse_move
    obj = MiniTest::Mock.new
    obj.expect :place, true, [3, 3, :north]
    obj.expect :move, true
    obj.expect :turn, true, [:left]
    obj.expect :turn, true, [:right]
    obj.expect :report, 'OUTPUT: 3,4,NORTH'
    obj.expect :invalid, false, ['MEEK']
    parser = Parser.new
    parser.parse_line('place 3, 3, north') { |*params| assert obj.send(*params) }
    parser.parse_line('move') { |*params| assert obj.send(*params) }
    parser.parse_line('left') { |*params| assert obj.send(*params) }
    parser.parse_line('right') { |*params| assert obj.send(*params) }
    parser.parse_line('report') { |*params| assert obj.send(*params) }
    parser.parse_line('meek') { |*params| assert obj.send(*params) == false }
    obj.expect :move, true
    parser.parse_line('move') { |*params| assert obj.send(*params) }
    obj.expect :report, 'OUTPUT: 3,4,NORTH'
    parser.parse_line('report') { |*params| assert obj.send(*params) }
    obj.expect :move, true
    parser.parse_line('move') { |*params| assert obj.send(*params) }
    obj.expect :report, 'OUTPUT: 3,4,NORTH'
    parser.parse_line('report') { |*params| assert obj.send(*params) }
  end
end

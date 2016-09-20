class Parser
  def initialize
    @exit = false
  end


  # Lines to parse
  # PLACE X,Y,F (where F is the direction)
  # MOVE
  # LEFT
  # RIGHT
  # REPORT
  # EXIT (to quit the command entering process)
  def parse_line(line)
    line = line.strip.upcase
    case line
    when /^PLACE.*/
      result = line.scan(/(?x)
        ^PLACE[ ]+
        ([0-9]+)[ ]*[,][ ]*
        ([0-9]+)[ ]*[,][ ]*
        (NORTH|SOUTH|EAST|WEST)$
      /)
      yield :place, result.first[0].to_i,
        result.first[1].to_i, result.first[2].downcase.to_sym
    when /^MOVE$/
      yield :move
    when /^LEFT$/
      yield :turn, :left
    when /^RIGHT$/
      yield :turn, :right
    when /^REPORT$/
      yield :report
    when /^EXIT$/
      @exit = true
    else
      yield :invalid, line
    end
  rescue StandardError
    yield :invalid, line
  end

  def exit?
    @exit
  end
end

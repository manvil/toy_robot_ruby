require File.join(Dir.pwd, 'load')
top = TableTop.new(5, 5)
parser = Parser.new

puts 'Please enter your commands. Type exit for quitting.'
until parser.exit?
  parser.parse_line(gets.chomp) do |method, *params|
    params.compact!
    if params.length.nonzero?
      top.send(method, *params)
    else
      top.send(method)
    end
  end
end

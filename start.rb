# Load the main files under the source folder
Dir[
  "#{File.dirname(__FILE__)}/src/*.rb"
].each { |f| require File.join(Dir.pwd, f) }

# Load the secondary files
# The loading of main ruby files is done in order to avoid
# recursive loading
Dir[
  "#{File.dirname(__FILE__)}/src/**/*.rb"
].each { |f| require File.join(Dir.pwd, f) }

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

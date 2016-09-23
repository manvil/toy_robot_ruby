require File.join(Dir.pwd, 'load')
require 'minitest/autorun'

Dir.glob("#{File.join(Dir.pwd, 'test')}/**/*.rb") do |f|
  puts f
  require f
end

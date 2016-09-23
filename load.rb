# Load the main files under the source folder
Dir[
  "#{File.dirname(__FILE__)}/src/*.rb"
].each { |f| require f }

# Load the secondary files
# The loading of main ruby files is done in order to avoid
# recursive loading
Dir[
  "#{File.dirname(__FILE__)}/src/**/*.rb"
].each { |f| require f }

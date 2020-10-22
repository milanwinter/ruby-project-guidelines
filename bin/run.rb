require_relative '../config/environment'
require_relative '../lib/cli.rb'
require_relative '../app/models/hair_salon.rb'
require_relative '../app/models/customer.rb'
require_relative '../app/models/review.rb'

cli = CLI.new
# cli.menu
cli.get_city



puts "HELLO WORLD"

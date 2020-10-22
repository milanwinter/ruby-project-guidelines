require_relative '../config/environment'
require_relative '../lib/cli.rb'
# require_relative '../app/models/hair_salon.rb'
# require_relative '../app/models/customer.rb'
# require_relative '../app/models/review.rb'
require_all 'app'

cli = CLI.new
cli.call




puts "HELLO WORLD"

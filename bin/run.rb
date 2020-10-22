require_relative '../config/environment'
require_relative '../lib/cli.rb'
require_relative '../lib/api_query.rb'
require_relative '../app/models/hair_salon.rb'
require_relative '../app/models/customer.rb'
require_relative '../app/models/review.rb'

cli = CLI.new
cli.welcome
cli.get_city

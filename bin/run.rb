# require_relative '../config/environment'
require_relative '../lib/cli.rb'
require_relative '../lib/api_query.rb'

cli = CLI.new
cli.welcome
cli.get_city

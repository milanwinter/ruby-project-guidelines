require_relative '../config/environment'
require_relative '../lib/cli.rb'

cli = CLI.new
cli.welcome
cli.get_location_from_user

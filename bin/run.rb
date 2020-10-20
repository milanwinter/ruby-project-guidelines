require_relative '../config/environment'
require_relative '../lib/cli.rb'

cli = CLI.new
cli.welcome
cli.find_by_highest_reviews



puts "HELLO WORLD"

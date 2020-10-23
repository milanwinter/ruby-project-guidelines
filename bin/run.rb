require_relative '../config/environment'
require_relative '../lib/cli.rb'
require 'colorize'
require_all 'app'

cli = CLI.new
cli.call




puts "HELLO WORLD"

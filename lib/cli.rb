require 'pry'

class CLI

    def welcome
        puts "Welcome to the SalonFindr App!"
    end

    def get_location_from_user
        puts "Please enter a location:"
        city = gets.chomp
    end
end
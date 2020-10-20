require 'pry'

class CLI

    def welcome
        puts "Welcome to the SalonFindr App!"
    end

    # def get_location_from_user
    #     puts "Please enter a location:"
    #     city = gets.chomp
    # end

    def find_by_highest_reviews
        puts "Please enter a location"
        city = gets.chomp
        hair_salon_by_highest_rating(city)
    end
end
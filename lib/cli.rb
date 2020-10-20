require 'pry'
require_relative '../lib/api_query.rb'

class CLI

    def welcome
        puts "Welcome to the SalonFindr App!"
        puts "Available Search Options"
        puts "-----------------------------------------"
        puts "1. Find hair salon with the highest rating."
        puts "2. Find hair salon based on price range."
        puts "3. Find the closest hair salon."
        puts "4. Find hair salon by name."
        puts "5. Exit Menu."
        puts
        puts
        puts "Enter your selection: "
        input = get_user_input
            if input == "1"
                puts "Please enter your location: "
                city = get_user_input
                puts hair_salon_by_highest_rating(city)
            end
    end

    def get_user_input
        gets.chomp.downcase
    end

    # def get_location_from_user
    #     puts "Please enter a location:"
    #     city = gets.chomp
    # end
end
require 'pry'

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
                hair_salon_by_highest_rating(city)
            end
    end

    def get_user_input
        gets.chomp.downcase
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

    def find_by_name
        puts "Please enter a name"
        name = gets.chomp
        find_hair_salon_by_name(name)
    end
end
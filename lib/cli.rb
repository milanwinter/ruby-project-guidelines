require 'pry'
require_relative '../lib/api_query.rb'


class CLI

    @@location

    def call
        intro
        get_location
        menu
    end
    
    def get_location
        puts "Please enter Location"
        location = gets.chomp
        @@location = location
    end

    def menu
        loop do
            city = @@location
            if city.downcase == "san francisco"
                display_menu
                number = gets.chomp
                
                case number
                when "1"
                    puts "Highest Rated Salons by most reviews"
                    HairSalon.top_10_highest_reviewed_salons_with_most_reviews
                    sub_menu_sf
                when "2"
                    puts "Would you like to sort by high-end or affordable salons?"
                    puts "Enter 1 for high-end and 2 for affordable"
                    number = gets.chomp
                    if number == "1"
                        puts "High End Salons:"
                        HairSalon.salons_by_highest_price
                        sub_menu_sf
                    else number == "2"
                        puts "Affordable Salons"
                        HairSalon.salons_by_lowest_price
                        sub_menu_sf
                    end
                when "3"
                    "Hair Salons That Are Open Now:"
                    hair_salon_open_now("San Francisco")
                    sub_menu_sf
                when "4"
                    puts "Please Enter a name of a Salon"
                    name = gets.chomp
                    HairSalon.hair_salon_info_by_name(name)
                when "5"
                    "Thank you for using SalonFindr! Have a great day"
                    exit
                else 
                    puts "Unavailable number entered. "
                end
                
                

            else
                display_menu
                # puts 'got into the else statement'
                number = gets.chomp
                case number
                    when "1"
                        hair_salon_with_most_review_and_highest_rating(city)
                        sub_menu_api
                    when "2"
                        puts "Would you like to sort by high-end or affordable salons?"
                        puts "Enter 1 for high-end and 2 for affordable"
                        number = gets.chomp
                        if number == "1"
                            puts "High End Salons:"
                            hair_salon_with_highest_price(city)
                         else number == "2"
                            puts "Affordable Salons"
                            hair_salon_with_lowest_price(city)
                        end
                        sub_menu_api
                    when "3"
                        hair_salon_open_now(city)
                        sub_menu_api
                    when "4"
                        puts "Please enter a name"
                        name = gets.chomp
                        find_hair_salon_by_name(city, name)
                        sub_menu_api
                    when "5"
                        "Thank you for using SalonFindr! Have a great day"
                        exit
                    else 
                        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                        puts "Unavailable number entered. Please enter to get back to menu."
                end
                
            end
        end
    end

    def sub_menu_sf
        loop do
            puts
            puts "--------------------------------------------------"
            puts "1. View more info about a hair salon."
            puts "2. Get Reviews "
            puts "3. Go back to main menu."
            puts "4. Exit"
            puts
            puts "Enter your selection: "
            num = gets.chomp
            if num == "1"
                puts "Please Enter the Name of the Hair Salon you want more info on"
                name = gets.chomp.titleize
                HairSalon.hair_salon_info_by_name(name)
            elsif num == "2"
                puts "Please Enter the Name of the Hair Salon you want reviews for"
                name = gets.chomp.titleize
                HairSalon.get_reviews_for_specific_salon(name)

            elsif num == "3"
                break
            elsif num == "4"
                exit
            end
        end
    end

    def sub_menu_api
        loop do
            city = @@location
            puts
            puts "--------------------------------------------------"
            puts "1. View more info about a hair salon."
            puts "2. Get Reviews "
            puts "3. Go back to main menu."
            puts "4. Exit"
            puts
            puts "Enter your selection: "
            num = gets.chomp
                case num 
                    when "1"
                        puts "Please Enter the Name of the Hair Salon you want more info on"
                        name = gets.chomp.titleize
                        find_hair_salon_by_name(city, name)
                    when "2"
                        puts "Please Enter the Name of the Hair Salon you want reviews for"
                        name = gets.chomp.titleize
                        hair_salon_first_three_reviews(city, name)
                    when "3"
                        break
                    when "4"
                        exit
                end
        end
    end
    # when "5"
    #     puts "please enter a name to get reviews"
    #     name = gets.chomp.titleize
    #     HairSalon.get_reviews_for_specific_salon(name)

    def display_menu
        puts "Available Search Options"
        puts "--------------------------------------------------"
        puts "1. Find hair salon with the highest ratings and most reviews."
        puts "2. Find hair salon based on price range."
        puts "3. Find hair salons that are open now."
        puts "4. Find hair salon info by name."
        puts "5. Exit Menu."
        puts
        puts
        puts "Enter your selection: "

    end
    
    def intro
        puts "Welcome to the SalonFindr App!"
    end

    
end




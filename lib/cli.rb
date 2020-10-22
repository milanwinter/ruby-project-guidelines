require 'pry'
require_relative '../lib/api_query.rb'

class CLI
    def welcome
        puts "Welcome to the SalonFindr App!"
    end

    def get_city
        puts "Please enter your location: "
        city = get_user_input
        puts
        if city.downcase == "san francisco"
            menu 
            get_input






            
        else
            menu
            input = get_user_input
            case input
            when "1"
                hair_salon_by_highest_rating(city)
            when "2"
                hair_salon_with_highest_price(city)
            when "3"
                hair_salon_with_lowest_price(city)
            when "4"
                hair_salon_open_now(city)
            when "5"
                puts "Please enter a name"
                name = gets.chomp
                find_hair_salon_by_name(city, name)
            when "6"
                puts
                puts "Thank you for using Salon Findr App <3."
                puts
                exit
            else 
                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                puts "Unavailable number entered. Please enter to get back to menu."
                gets
                get_city
            end
        puts
        puts "------------------------------------------------"
        puts "1. View hair salon's top rated reviews."
        puts "2. Go back to main menu."
        puts
        puts
        puts "Enter your selection: "
        input = get_user_input
        case input 
        when "1"
            puts "Please enter salon's name: "
            name = gets.chomp
            hair_salon_first_three_reviews(city, name)
            sub_menu
        when "2"
            menu
            function
        end
        end
    end
            
        
    def menu
        puts "Available Search Options"
        puts "------------------------------------------------"
        puts "1. Find hair salon with the highest rating."
        puts "2. Find high-end salon."
        puts "3. Find hair salon with affordable price."
        puts "4. Find hair salons that are open now."
        puts "5. Find hair salon info by name."
        puts "6. Exit Menu."
        puts
        puts
        puts "Enter your selection: "
    end

    def sub_menu
        puts
        puts "------------------------------------------------"
        puts "1. View more info about your hair salon."
        puts "2. Go back to main menu."
        puts
        puts
        puts "Enter your selection: "
    end
        
    def function
        get_city
        case input
        when "1"
            hair_salon_by_highest_rating(city)
        when "2"
            hair_salon_with_highest_price(city)
        when "3"
            hair_salon_with_lowest_price(city)
        when "4"
            hair_salon_open_now(city)
        when "5"
            puts "Please enter a name"
            name = gets.chomp
            find_hair_salon_by_name(city, name)
        when "6"
            puts "Thank you for using Salon Findr App <3."
            exit
        else 
            puts "Unavailable number entered. Please enter to get back to menu."
            gets
            get_city
        end
    end


    def get_input
        input = get_user_input
    end

    def get_user_input
        gets.chomp.downcase
    end
end



require 'pry'
require_relative '../lib/api_query.rb'

class CLI
    
    def get_city
        puts "Welcome to the SalonFindr App!"
        puts "Please enter your location: "
        city = get_user_input
        if city == "San Francisco"
            menu 
            get_input






            
        else
            menu
            input = get_user_input
            case input
                when "1"
                    hair_salon_by_highest_rating(city)
                when "2"
                    hair_salon_by_price_range(city)
                when "3"
                    hair_salon_open_now(city)
                when "4"
                    puts "Please enter a name"
                    name = gets.chomp
                    find_hair_salon_by_name(city, name)
                when "5"
                    puts "Thank you for using Salon Findr App <3."
                    exit
                else 
                    puts "Unavailable number entered. Please enter to get back to menu."
                    gets
                    return get_city
            end
            puts
            puts "------------------------------------------------"
            puts "1. More information about hair salon."
            puts "2. Go back to main menu."
            puts
            puts
            puts "Enter your selection: "
            input = get_user_input
                case input 
                    when "1"
                        puts "Please enter salon's name: "
                        name = gets.chomp
                        find_hair_salon_by_name(city, name)
                    when "2"
                        menu
                        function
                end
        end
    end


    def function
        input = get_user_input
        case input
        when "1"
            hair_salon_by_highest_rating(city)
        when "2"
            hair_salon_by_price_range(city)
        when "3"
            hair_salon_open_now(city)
        when "4"
            puts "Please enter a name"
            name = gets.chomp
            find_hair_salon_by_name(city, name)
        when "5"
            puts "Thank you for using Salon Findr App <3."
            exit
        else 
            puts "Unavailable number entered. Please enter to get back to menu."
            gets
            get_city
        end
    end

    def menu
        puts "Available Search Options"
        puts "------------------------------------------------"
        puts "1. Find hair salon with the highest rating."
        puts "2. Find hair salon based on price range."
        puts "3. Find hair salons that are open now."
        puts "4. Find hair salon info by name."
        puts "5. Exit Menu."
        puts
        puts
        puts "Enter your selection: "

    end

    def get_input
        input = get_user_input
    end


    def get_user_input
        gets.chomp.downcase
    end
end

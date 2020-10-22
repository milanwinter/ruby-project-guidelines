require 'pry'
require_relative '../lib/api_query.rb'


class CLI

    def menu
        puts "Available Search Options"
        puts "------------------------------------------------"
        puts "1. Find hair salon with the highest ratings and most reviews."
        puts "2. Find hair salon based on price range."
        puts "3. Find hair salons that are open now."
        puts "4. Find hair salon info by name."
        puts "5. Exit Menu."
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
            input = get_user_input
                case input 
                    when "1"
                        puts "Please enter salon's name: "
                        name = gets.chomp
                        hair_salon_first_three_reviews(city, name)
                        sub_menu
                    when "2"
                        function
                end
    end

    def sub_menu_2
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
                        HairSalon.get_reviews_for_specific_salon(name)
                        sub_menu_2
                    when "2"
                        function_2
                end
    end
    
    def welcome
        puts "Welcome to the SalonFindr App!"
    end

    def get_city
        puts "Please enter your location: "
        city = get_user_input
        puts
        if city.downcase == "san francisco"
            menu 
            input = get_input
            case input
            when "1"
                HairSalon.top_10_highest_reviewed_salons_with_most_reviews
            when "2"
                puts "Would you like to sort by high-end or affordable salons?"
                puts "Enter 1 for high-end and 2 for affordable"
                number = get_input
                if number == "1"
                    puts "List of high-end hair salons: "
                    HairSalon.salons_by_highest_price
                else number == "2"
                    puts "List of affordable hair salons:"
                    HairSalon.salons_by_lowest_price
                end
            when "3"
                hair_salon_open_now("San Francisco")
            when "4"
                puts "Please Enter a name of a Salon"
                name = get_input
                HairSalon.hair_salon_info_by_name(name)
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
                        HairSalon.get_reviews_for_specific_salon(name)
                        sub_menu_2
                    when "2"
                        function_2
                end



        else
            menu
            input = get_user_input
            case input
            when "1"
                hair_salon_by_highest_rating(city)
            when "2"
                puts "Would you like to sort by high-end or affordable salons?"
                puts "Enter 1 for high-end and 2 for affordable"
                number = get_input
                if number == "1"
                    hair_salon_with_highest_price(city)
                else number == "2"
                    hair_salon_with_lowest_price(city)
                end
            when "3"
                hair_salon_open_now(city)
            when "4"
                puts "Please enter a name"
                name = gets.chomp
                find_hair_salon_by_name(city, name)
            when "5"
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
                        function
                end
        end
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

    def function_2
        get_city
        case input
        when "1"
            HairSalon.top_10_highest_reviewed_salons_with_most_reviews
        when "2"
            puts "Would you like to sort by high-end or affordable salons?"
            puts "Enter 1 for high-end and 2 for affordable"
            number = get_input
            if number == "1"
                HairSalon.salons_by_highest_price
            else number == "2"
                HairSalon.salons_by_lowest_price
            end
        when "3"
            hair_salon_open_now("San Francisco")
        when "4"
            puts "Please Enter a name of a Salon"
            name = get_input
            HairSalon.hair_salon_info_by_name(name)
        when "5"
            puts "Thank you for using Salon Findr App <3."
            exit
        else 
            puts "Unavailable number entered. Please enter to get back to menu."
            gets
            return get_city
        end           
    end


    def get_input
        input = get_user_input
    end

    def get_user_input
        gets.chomp
    end
end



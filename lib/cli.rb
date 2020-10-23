require 'pry'
require 'colorize'

    class CLI

        @@location

        def call
            intro
            get_location
            menu
        end
        
        def get_location
            puts "Please enter a city.".colorize(:color => :magenta)
            location = gets.chomp.titleize
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
                        puts "Highest Rated Salons by most reviews".colorize(:color => :magenta)
                        HairSalon.top_20_highest_reviewed_salons_with_most_reviews
                        sub_menu_sf
                    when "2"
                        puts "Would you like to sort by high-end or affordable salons?".colorize(:color => :magenta)
                        puts "                                                        ".colorize(:color => :magenta)
                        puts "--------------------------------------------------------".colorize(:color => :magenta)
                        puts "Enter 1 for high-end and 2 for affordable".colorize(:color => :magenta)
                        number = gets.chomp
                        if number == "1"
                            puts "High End Salons:".colorize(:color => :magenta)
                            HairSalon.salons_by_highest_price
                            sub_menu_sf
                        else number == "2"
                            puts "Affordable Salons".colorize(:color => :magenta)
                            HairSalon.salons_by_lowest_price
                            sub_menu_sf
                        end
                    when "3"
                        "Hair Salons That Are Open Now:".colorize(:color => :magenta)
                        hair_salon_open_now("San Francisco").colorize(:color => :magenta)
                        sub_menu_sf
                    when "4"
                        puts "Please Enter a name of a Salon".colorize(:color => :magenta)
                        name = gets.chomp
                        HairSalon.hair_salon_info_by_name(name)
                    when "5"
                        get_location
                        menu
                    when "6"
                        "Thank you for using SalonFindr! Have a great day".colorize(:color => :magenta)
                        exit
                    else 
                        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" .colorize(:color => :red, :background => :black)
                        puts "Sorry we didn't recognize that :( ".colorize(:color => :red, :background => :black)
                    end
                    
                    

                else
                    display_menu
                    number = gets.chomp
                    case number
                        when "1"
                            puts "Highest Rated Salons by most reviews".colorize(:color => :magenta)
                            hair_salon_with_most_review_and_highest_rating(city)
                            sub_menu_api
                        when "2"
                            puts "Would you like to sort by high-end or affordable salons?".colorize(:color => :magenta)
                            puts "Enter 1 for high-end and 2 for affordable".colorize(:color => :magenta)
                            number = gets.chomp
                            if number == "1"
                                puts "High End Salons:".colorize(:color => :magenta)
                                hair_salon_with_highest_price(city)
                                sub_menu_api
                             else number == "2"
                                puts "Affordable Salons".colorize(:color => :magenta)
                                hair_salon_with_lowest_price(city)
                                sub_menu_api
                            end
                        when "3"
                            "Hair Salons That Are Open Now:".colorize(:color => :magenta)
                            hair_salon_open_now(city)
                            sub_menu_api
                        when "4"
                            puts "Please enter a name".colorize(:color => :magenta)
                            name = gets.chomp
                            find_hair_salon_by_name(city, name)
                            sub_menu_api
                        when "5"
                            get_location
                            menu
                        when "6"
                            "Thank you for using SalonFindr! Have a great day".colorize(:color => :magenta)
                            exit
                        else 
                            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:color => :red, :background => :black)
                            puts "Sorry we didn't recognize that :( ".colorize(:color => :red, :background => :white)
                    end
                    
                end
            end
        end

        def sub_menu_sf
            loop do
                puts
                puts "------------------------------------------------".colorize(:color => :magenta)
                puts "1. View more info about a hair salon.".colorize(:color => :magenta)
                puts "2. Get Reviews ".colorize(:color => :magenta)
                puts "3. Go back to main menu.".colorize(:color => :magenta)
                puts "4. Exit".colorize(:color => :magenta)
                puts "Enter your selection: ".colorize(:color => :magenta)
                num = gets.chomp
                if num == "1".colorize(:color => :magenta)
                    puts "Please Enter the Name of the Hair Salon you want more info on".colorize(:color => :magenta)
                    name = gets.chomp
                    HairSalon.hair_salon_info_by_name(name)
                elsif num == "2"
                    puts "Please Enter the Name of the Hair Salon you want reviews for".colorize(:color => :magenta)
                    name = gets.chomp
                    HairSalon.get_reviews_for_specific_salon(name)

                elsif num == "3"
                    break
                elsif num == "4"
                    exit
                else
                    puts "Sorry we didn't recognize that.".colorize(:color => :red, :background => :black)
                end
            end
        end

        def sub_menu_api
            loop do
                puts
                puts "------------------------------------------------".colorize(:color => :magenta)
                puts "1. View more info about a hair salon.".colorize(:color => :magenta)
                puts "2. Get Reviews".colorize(:color => :magenta)
                puts "3. Go back to main menu.".colorize(:color => :magenta)
                puts "4. Exit App".colorize(:color => :magenta)
                puts "Enter your selection: ".colorize(:color => :magenta)
                num = gets.chomp
                    if num == "1"
                        puts "Please Enter the Name of the Hair Salon you want more info on".colorize(:color => :magenta)
                        name = gets.chomp
                        find_hair_salon_by_name(@@location,name)
                    elsif num == "2"
                        puts "Please Enter the Name of the Hair Salon you want reviews for".colorize(:color => :magenta)
                        name = gets.chomp
                        hair_salon_first_three_reviews(@@location,name)
                    elsif num == "3"
                        break
                    elsif num == "4"
                        exit
                    else
                        puts "Sorry we couldn't recognize that".colorize(:color => :red, :background => :black)
                    end
            end
        end

        

        def display_menu
            puts "Available Search Options".colorize(:color => :magenta)
            puts "------------------------------------------------".colorize(:color => :magenta)
            puts "1. Find hair salon with the highest ratings and most reviews.".colorize(:color => :magenta)
            puts "2. Find hair salon based on price range.".colorize(:color => :magenta)
            puts "3. Find hair salons that are open now.".colorize(:color => :magenta)
            puts "4. Find hair salon info by name.".colorize(:color => :magenta)
            puts "5. Enter New Location".colorize(:color => :magenta)
            puts "6. Exit Menu.".colorize(:color => :magenta)
            puts
            puts "Enter your selection: ".colorize(:color => :magenta)
            puts "                                                                          "
    
        end
        
        def intro
            puts "Welcome to the SalonFindr App!".colorize(:color => :magenta)
        end
 
        
    end

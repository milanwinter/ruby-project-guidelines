require 'pry'


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

        def get_city
            puts "Welcome to the SalonFindr App!"
            puts "Please enter your location: "
            city = get_user_input
            if city == "San Francisco" || "san francisco"
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
                    puts "please enter a name to get reviews"
                    name = gets.chomp.titleize
                    HairSalon.get_reviews_for_specific_salon(name)
                when "6"
                    puts "Thank you for using Salon Findr App <3."
                    exit
                else 
                    puts "Unavailable number entered. Please enter to get back to menu."
                    gets
                    return get_city
            end
                
            else
                menu
                puts "getting to else statement"
                input = get_user_input
                case input
                    when "1"
                        hair_salon_by_highest_rating
                    when "2"
                        hair_salon_by_price_range
                    when "3"
                        hair_salon_open_now
                    when "4"
                        puts "Please enter a name"
                        name = gets.chomp
                        find_hair_salon_by_name
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


        def get_input
            input = gets.chomp
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

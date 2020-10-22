require 'pry'


    class CLI

        # def welcome
        #     puts "Welcome to the SalonFindr App"
        #    puts "Available Search Options"
        #end 
        # def location
            #puts please enter location
            #gets location from user
         # end
        
        #if location == "San Francisco"
            #puts menu
            #runs the rest of the cli using model/methods
        #else
            #puts menu
            #runs cli using api_query
        #     puts "-----------------------------------------"
        #     puts "DONE. Hair Salons with the highest ratings and most reviews"
        #     puts "DONE. Find hair salons based on price range 
                            #low -high."
                            #output 10 salons
                                #user inputs 1-10 for reviews for salon
        #     puts "3. Find hair salons that are open now."
        #     puts "4. Find hair salon info by name."
        #     puts "5. Exit Menu."
        #     puts
        #     puts sub menu
                    #get reviews for selected salon
        #     puts "Enter your selection: "
        #     input = get_user_input
        #     case input

        #     when input == "1" #Finding Top 10 Hair salons with the highest ratings/most reviews(5)
                
        #     when 
                
        #     else
                
        #     end

        # end

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

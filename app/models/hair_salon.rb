class HairSalon < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def self.add_reviews_for_each_salon
        Review.all.each do |review|
             HairSalon.all.each do |salon|
                 if review.business_website.slice(0..50) == salon.website.slice(0..50)
                 salon.reviews << review
                 end
             end
         end
    end

    def self.most_reviewed_salons
        HairSalon.order(number_of_reviews: :desc)
    end

    def self.top_20_highest_reviewed_salons_with_most_reviews
       salon = self.most_reviewed_salons.select{|salon| salon.rating == 5}.take(20).to_a
       self.print_out_basic_info(salon)
    end


    def self.salons_by_highest_price
        salons = self.all.select{|salon| salon.price == "$$$"}.take(20).to_a
        self.print_out_basic_info(salons)
    end

    def self.salons_by_lowest_price
       salons = self.all.select{|salon| salon.price == "$"}.take(20).to_a
       self.print_out_basic_info(salons)
    end

    def self.hair_salon_info_by_name(name)
        salon = self.all.select{|salon| salon.name == name}
        if salon.length == 1
            self.print_out_full_info(salon)
        else
            puts "---------------------------------------------------------------------".colorize(:color => :red)
            puts "Sorry, no Salon found by that name, please check your spelling and capitalization."
        end
    end

    def self.print_out_basic_info(aoh)
        list = aoh.each do |salon|
            puts "--------------------------------------------------".colorize(:color => :red)
            puts "Name: #{salon.name}"
            puts "Rating out of 5: #{salon.rating}"
            puts "Price: #{salon.price}"
            puts "Number of Reviews #{salon.number_of_reviews}"
            puts "                                "
            puts "--------------------------------------------------".colorize(:color => :red)
        end
    end

    def self.print_out_full_info(array_of_salon_hashes)
        #output readable list of info
        list = array_of_salon_hashes.each do |salon|
            puts "--------------------------------------------------".colorize(:color => :red)
            puts "Name: #{salon.name}"
            puts "Number of Reviews: #{salon.number_of_reviews}"
            puts "Rating out of 5: #{salon.rating}"
            puts "Price: #{salon.price}"
            puts "Location: #{salon.location}"
            puts "Phone Nummber: #{salon.phone_number}"
            puts "Website: #{salon.website}"
            puts "--------------------------------------------------".colorize(:color => :red)
        end
        list
    end

    def self.get_reviews_for_specific_salon(name)
        # binding.pry
        salon = self.all.select{|salon| salon.name == name}
        if salon.length == 1
            reviews = Review.all.select do |review|
                review.hair_salon_id == salon.first.id
            end
                Review.make_reviews_readable(reviews)
        else
            puts "---------------------------------------------------------------------".colorize(:color => :red)
            puts "Sorry, no Salon found by that name, please check your spelling and capitalization."
        end
    end

end

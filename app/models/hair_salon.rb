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

    def self.top_10_highest_reviewed_salons_with_most_reviews
       self.most_reviewed_salons.select{|salon| salon.rating == 5}.take(10).to_a
    end


    def self.salons_by_highest_price
        self.all.select{|salon| salon.price == "$$$"}.take(10).to_a
    end

    def self.salons_by_lowest_price
        self.all.select{|salon| salon.price == "$"}.take(10).to_a
    end

    def self.hair_salon_info_by_name(name)
        self.all.select{|salon| salon.name == name}
    end

    def self.print_out_info(array_of_salon_hashes)
        #output readable list of info
        list = array_of_salon_hashes.each do |salon|
            puts "-------------------------"
            puts "Name: #{salon.name}"
            puts "Number of Reviews: #{salon.number_of_reviews}"
            puts "Rating out of 5: #{salon.rating}"
            puts "Price: #{salon.price}"
            puts "Location(s): #{salon.location}"
            puts "Phone Nummber: #{salon.phone_number}"
            puts "--------------------------"
        end
        list
    end









end
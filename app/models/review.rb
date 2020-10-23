class Review < ActiveRecord::Base
    belongs_to :customer
    belongs_to :hair_salon

    def self.make_reviews_readable(array_of_reviews)
        # binding.pry
       list = array_of_reviews.each do |review|
            puts "--------------------------------------------------".colorize(:color => :red)
            puts "Customer Name: #{review.name}"
            puts "Number of stars out of 5: #{review.number_of_stars}"
            puts "Comment: #{review.comment}"
            puts "Date reviewed #{review.date.strftime("%d/%m/%Y")}"
            puts "--------------------------------------------------".colorize(:color => :red)
        end
        list
    end
    
end
class Review < ActiveRecord::Base

    belongs_to :customer
    belongs_to :hair_salons

    def self.make_reviews_readable(array_of_reviews)
        # binding.pry
       list = array_of_reviews.each do |review|
            puts "----------------------"
            puts "Customer Name: #{review.name}"
            puts "Number of stars out of 5: #{review.number_of_stars}"
            puts "Comment: #{review.comment}"
            # binding.pry
        
            puts "Date reviewed #{review.date.strftime("%d/%m/%Y")}"
        end
        list
    end

end
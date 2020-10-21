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

end
class Customer < ActiveRecord::Base
    has_many :reviews

    def self.create_new_customer
        Review.all.each do |review|
            Customer.create(
                name: review.name,
                review_id: review.id
            )
        end
    end

    def self.add_review_for_customer
        Customer.all.each do |customer|
            Review.all.each do |review|
                if customer.review_id == review.id
                    customer.reviews << review
                end
            end
        end
    end
end
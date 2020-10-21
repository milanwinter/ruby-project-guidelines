require "json"
require 'http'
require 'pry'
require_relative '../lib/api_query.rb'


  def create_new_businesses_in_table
    list_of_hair_salons.each do |business|
        HairSalon.create(
          name: business["name"], 
          rating: business["rating"], 
          location: business["location"]["display_address"].join(" "),
          price: business["price"],website: business["url"], 
          phone_number: business["display_phone"], 
          number_of_reviews: business["review_count"]
         )
    end
  end

  def create_new_reviews_in_table
    list_of_reviews.each do |review|
        Review.create(
            name: review["user"]["name"],
            date: review["time_created"],
            comment: review["text"],
            number_of_stars: review["rating"],
            business_website: review["url"]
          )
    end
end

create_new_businesses_in_table
create_new_reviews_in_table

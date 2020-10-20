require "json"
require 'http'
require 'pry'
require_relative '../lib/api_query.rb'


    def create_new_businesses_in_table
        list_of_hair_salons("san francisco").each do |business|
            HairSalon.create(name: business["name"], 
                rating: business["review_count"],
                location: business["location"]["display_address"].join(" "),
                price: business["price"],
                website: business["url"],
                phone_number: business["display_phone"],
                number_of_reviews: business["review_count"])
        end
    end
    create_new_businesses_in_table

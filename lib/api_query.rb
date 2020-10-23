require "json"
require 'http'
require 'pry'
require_relative "../config/Constants.rb"

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/" 
DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 50

API_KEY = YELP_API_KEY

def search(term ="hair salon", location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
  
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse
end

def business(business_id)
    url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    response.parse
end

def business_reviews(business_id)
    url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"
    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    response.parse["reviews"]
end

def list_of_reviews(city)
    list = []
    list_of_business_id(city).each do |id|
        list << business_reviews(id)
    end
    list.flatten
end

def list_of_hair_salons(city)
      data = search(city)
      list = []
      data["businesses"].each do |business|
        list << business
      end
      list
end

def list_of_business_id(city)
    list = []
    list_of_hair_salons(city).map do |hair_salon|
       list << hair_salon["id"]
    end
    list
end

def list_of_salon_info(city)
    list = list_of_business_id(city).map do |id|
        business(id)
    end
    list
end

def readable_list(array_of_hashes)
    list = array_of_hashes.each do |business|
        puts "-------------------------"
        puts "Name: #{business["name"]}"
        puts "Number of Reviews: #{business["review_count"]}"
        puts "Rating out of 5: #{business["rating"]}"
        puts "Price: #{business["price"]}"
        puts "Location: #{business["location"]["display_address"].join(" ")}"
        puts "Phone Nummber: #{business["display_phone"]}"
        puts "Website: #{business["url"]}"
        puts "--------------------------"
    end
    list
end

def general_list(aoh)
    aoh.each do |business|
        puts "--------------------------------------------------"
        puts "Name: #{business["name"]}"
        puts "Price: #{business["price"]}"
        puts "Rating out of 5: #{business["rating"]}"
        puts "Number of Reviews: #{business["review_count"]}"

        puts "--------------------------------------------------"
    end
end

def hair_salon_with_most_review_and_highest_rating(city)
    list = hair_salon_with_most_reviews(city).select{|business| business["rating"] == 5.0}
    general_list(list)
end

def hair_salon_with_most_reviews(city)
    list_of_hair_salons(city).sort_by{|business| business["review_count"]}.reverse    
end

def hair_salon_with_highest_price(city)
    list = list_of_hair_salons(city).select{|business| business["price"] == "$$$"}
    general_list(list)
end

def hair_salon_with_lowest_price(city)
    list = list_of_hair_salons(city).select{|business| business["price"] == "$"}
    general_list(list)
end

def hair_salon_open_now(city)
    list = list_of_salon_info(city).map do |business|
        if business["hours"].first["is_open_now"] === true
            business
        end
    end.compact
    readable_list(list)
end

def find_hair_salon_by_name(location, name)
    salon = list_of_hair_salons(location).select {|salon| salon["name"] == name}
    if salon.length == 1
        readable_list(salon)
    else
        puts ""
        puts "No Salon found. Please review salon's name."
    end
end

# def hair_salon_by_highest_rating(city)
#     list = list_of_hair_salons(city).sort_by{|business| business["rating"]}.reverse
#     general_list(list)
# end




def rendered_list(aoh)
    #binding.pry
    aoh.each do |review|
        puts "--------------------------------------------------"
        puts "Name: #{review["user"]["name"]}"
        puts "Comment: #{review["text"]}"
        puts "Number of stars: #{review["rating"]}"
        puts "Date: #{review["time_created"]}"
        puts "--------------------------------------------------"      
    end
end

def hair_salon_first_three_reviews(city, name)
    list = list_of_hair_salons(city).collect{|business|
        if business["name"] == name
            business_reviews(business["id"])
        end
    }.compact.first
    #binding.pry
    rendered_list(list)
end
  
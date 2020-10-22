require "json"
require 'http'
require 'pry'

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/" 
DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 50

API_KEY = ENV["YELP_API_KEY"]

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
        puts "Location(s): #{business["location"]["display_address"].join(" ")}"
        puts "Phone Nummber: #{business["phone"]}"
        puts "--------------------------"
    end
    list
end

def hair_salon_open_now(city)
    list = list_of_salon_info(city).map do |business|
        if business["hours"].first["is_open_now"] === true
            business
        end
    end.compact
    readable_list(list)
end

def hair_salon_by_highest_rating(city)
    list = list_of_hair_salons(city).sort_by{|business| business["rating"]}.reverse
    readable_list(list)
end

def find_hair_salon_by_name(location = "San Francisco", name)
    salon = list_of_hair_salons(location).select {|salon| salon["name"] == name}
    if salon.length == 1
        readable_list(salon)
    else
        puts ""
        puts "No Salon found. Please review salon's name."
end


#  binding.pry
  
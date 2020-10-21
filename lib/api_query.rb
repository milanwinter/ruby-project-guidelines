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

def search(term ="hair salon", location="San Francisco")
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

def list_of_reviews
    list = []
    list_of_business_id.each do |id|
        list << business_reviews(id)
    end
    list.flatten
end

def list_of_hair_salons
      data = search
      list = []
      data["businesses"].each do |business|
        list << business
      end
      list
end

def list_of_business_id
    list = []
    list_of_hair_salons.map do |hair_salon|
       list << hair_salon["id"]
    end
    list
end

def list_of_salon_info
    list = list_of_business_id.map do |id|
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

def hair_salon_by_highest_rating
    list = list_of_hair_salons.sort_by{|business| business["rating"]}.reverse
    readable_list(list)
end

def find_hair_salon_by_name(location = "San Francisco", name)
    salon = list_of_hair_salons(location).select {|salon| salon["name"] == name}
    readable_list(salon)
end


#  binding.pry
  
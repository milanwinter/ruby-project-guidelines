require "json"
require 'http'
require 'pry'

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/" 
DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 10

API_KEY = ENV["YELP_API_KEY"]

def search(term="hair salon", location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
  
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse
  end

# def get_hair_salon_based_on_location(city)
#     p search(city)
# end

def list_of_hair_salons(city)
    list = []
    data = search(city)
    data["businesses"].each do |business|
        list << business
    end
    p list
end

def readable_list(aoh)
    aoh.each do |business|
        puts "--------------------------------------------------"
        puts "Name: #{business["name"]}"
        puts "Number of Reviews: #{business["review_count"]}"
        puts "Rating out of 5: #{business["rating"]}"
        puts "Price: #{business["price"]}"
        puts "Location: #{business["location"]["display_address"].join(" ")}"
        puts "Phone Number: #{business["phone"]}"
        puts "--------------------------------------------------"
    end
end

def hair_salon_by_highest_rating(city)
    list = list_of_hair_salons(city).sort_by{|business| -business["rating"]}
    readable_list(list)
end

#binding.pry


  

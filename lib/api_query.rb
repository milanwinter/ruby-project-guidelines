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
        binding.pry
    end
    p list
end
a = list_of_hair_salons("san jose")
binding.pry


  

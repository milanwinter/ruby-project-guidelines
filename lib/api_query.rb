require "json"
require 'http'
require 'pry'

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/" 
DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 5

API_KEY = ENV["YELP_API_KEY"]

def search(term, location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
  
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse
  end

  list = search("hair salon", "san jose")
  binding.pry

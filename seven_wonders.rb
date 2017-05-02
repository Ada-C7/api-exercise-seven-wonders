require 'httparty'
require 'dotenv/load'
require 'awesome_print'

#Starter Code:

BASE_URL = "https://maps.googleapis.com/maps/api/geocode/json\?"
API_KEY = ENV["API_KEY"]

def find_location(landmark)
  query_params = {
    "address" => landmark,
    "key" => API_KEY,
  }

  return HTTParty.get(BASE_URL, query: query_params)
end

ap find_location("Florida")

#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Lighthouse of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}

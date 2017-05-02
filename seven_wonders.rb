require 'httparty'
require 'dotenv/load'
require 'awesome_print'

BASE_URL = "https://maps.googleapis.com/maps/api/geocode/json\?"
API_KEY = ENV["API_KEY"]

def find_location(landmark)
  query_params = {
    # Replace spaces with '+' for URL
    "address" => landmark.split(" ").join("+"),
    "key" => API_KEY,
  }
  data = HTTParty.get(BASE_URL, query: query_params) #.parsed_response not needed?
  # See sample JSON hash below
  location = data['results'].first['geometry']['location']
end

# Starter Code:
seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

wonder_location = Hash.new

seven_wonders.each do |wonder|
  wonder_location[wonder] = find_location(wonder)
end

ap wonder_location


# GOOGLE GEOCODE JSON RESPONSE EXAMPLE
  # {
  #    "results" : [
  #       {
  #          "address_components" : [
  #             {
  #                "long_name" : "1600",
  #                "short_name" : "1600",
  #                "types" : [ "street_number" ]
  #             },
  #             {
  #                "long_name" : "Amphitheatre Pkwy",
  #                "short_name" : "Amphitheatre Pkwy",
  #                "types" : [ "route" ]
  #             },
  #             {
  #                "long_name" : "Mountain View",
  #                "short_name" : "Mountain View",
  #                "types" : [ "locality", "political" ]
  #             },
  #             {
  #                "long_name" : "Santa Clara County",
  #                "short_name" : "Santa Clara County",
  #                "types" : [ "administrative_area_level_2", "political" ]
  #             },
  #             {
  #                "long_name" : "California",
  #                "short_name" : "CA",
  #                "types" : [ "administrative_area_level_1", "political" ]
  #             },
  #             {
  #                "long_name" : "United States",
  #                "short_name" : "US",
  #                "types" : [ "country", "political" ]
  #             },
  #             {
  #                "long_name" : "94043",
  #                "short_name" : "94043",
  #                "types" : [ "postal_code" ]
  #             }
  #          ],
  #          "formatted_address" : "1600 Amphitheatre Parkway, Mountain View, CA 94043, USA",
  #          "geometry" : {
  #             "location" : {
  #                "lat" : 37.4224764,
  #                "lng" : -122.0842499
  #             },
  #             "location_type" : "ROOFTOP",
  #             "viewport" : {
  #                "northeast" : {
  #                   "lat" : 37.4238253802915,
  #                   "lng" : -122.0829009197085
  #                },
  #                "southwest" : {
  #                   "lat" : 37.4211274197085,
  #                   "lng" : -122.0855988802915
  #                }
  #             }
  #          },
  #          "place_id" : "ChIJ2eUgeAK6j4ARbn5u_wAGqWA",
  #          "types" : [ "street_address" ]
  #       }
  #    ],
  #    "status" : "OK"
  # }

#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Lighthouse of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}

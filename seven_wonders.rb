require 'httparty'
require 'json'

BASE_URL = "https://maps.googleapis.com/maps/api/geocode/json?"

SEVEN_WONDERS = [
  "Great+Pyramind+of+Giza",
  "Hanging+Gardens+of+Babylon",
  "Colossus+of+Rhodes",
  "Lighthouse+of+Alexandria",
  "Statue+of+Zeus+at+Olympia",
  "Temple+of+Artemis",
  "Mausoleum+at+Halicarnassus"
]

seven_wonders_coordinates = {}

SEVEN_WONDERS.each do |one_wonder|
  url ="#{BASE_URL}address=#{one_wonder}"
  response = HTTParty.get(url).parsed_response

  latitude =  response["results"][0]["geometry"]["location"]["lat"].to_json
  longitude = response["results"][0]["geometry"]["location"]["lng"].to_json

  one_wonder_name = one_wonder.tr('+', ' ')

  seven_wonders_coordinates.merge!( one_wonder_name =>{"lat" => latitude, "lng" => longitude})
end

puts JSON.pretty_generate(seven_wonders_coordinates)

#Example Output:
# 
# {
#   "Great Pyramind of Giza": {
#     "lat": "29.9792345",
#     "lng": "31.1342019"
#   },
#   "Hanging Gardens of Babylon": {
#     "lat": "32.5422374",
#     "lng": "44.42103609999999"
#   },
#   "Colossus of Rhodes": {
#     "lat": "36.45106560000001",
#     "lng": "28.2258333"
#   },
#   "Lighthouse of Alexandria": {
#     "lat": "38.7904054",
#     "lng": "-77.040581"
#   },
#   "Statue of Zeus at Olympia": {
#     "lat": "37.6379375",
#     "lng": "21.6302601"
#   },
#   "Temple of Artemis": {
#     "lat": "37.9498715",
#     "lng": "27.3633807"
#   },
#   "Mausoleum at Halicarnassus": {
#     "lat": "37.038132",
#     "lng": "27.4243849"
#   }
# }

require 'httparty'
require 'awesome_print'

def location(place_arry)
  @url = "https://maps.googleapis.com/maps/api/geocode/json"
  @place_hash = {}

  place_arry.each do |place|
    query_params = {"address" => place}
    response = HTTParty.post(@url,query: query_params)
    @place_hash[place] = response["results"][0]["geometry"]["location"]
  end
  return @place_hash
end

seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]
print loc = location(seven_wonders)

require 'httparty'
require 'awesome_print'

seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

URL = "https://maps.googleapis.com/maps/api/geocode/json?address="

seven_wonders_hash = {}

seven_wonders.each do |wonder|
  response = HTTParty.get("#{URL}#{wonder}")
  seven_wonders_hash[wonder] = response["results"][0]["geometry"]["location"]
end

  puts seven_wonders_hash

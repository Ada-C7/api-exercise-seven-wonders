require 'httparty'
require 'awesome_print'

seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

BASE_URL = "https://maps.googleapis.com/maps/api/geocode/json?address="

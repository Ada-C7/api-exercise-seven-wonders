require 'httparty'

#Starter Code:
seven_wonders = ["Great Pyramid of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

response_hash = {}

# Friendly human readable output:
seven_wonders.each do |wonder|
@parsed_response = HTTParty.get("http://maps.google.com/maps/api/geocode/json?address=#{wonder}").parsed_response
wonder_lat = @parsed_response["results"][0]["geometry"]["location"]["lat"]
wonder_lng = @parsed_response["results"][0]["geometry"]["location"]["lng"]

response_hash[wonder] = {"lat": wonder_lat, "lng": wonder_lng}

#puts "#{wonder}: Latitude: #{@parsed_response["results"][0]["geometry"]["location"]["lat"]}, Longitude: #{@parsed_response["results"][0]["geometry"]["location"]["lng"]}"

end


puts response_hash.length

#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Lighthouse of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}


# ADD BIKING DIR TO EACH (or just temple of artemis)

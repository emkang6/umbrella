require "http"
require "json"

pp "Where are you currently?"

user_location = gets.chomp

#user_location = "Chicago"

pp user_location

GMAPS_KEY = "AIzaSyDKz4Y3bvrTsWpPRNn9ab55OkmcwZxLOHI"
maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=#{GMAPS_KEY}"

response = HTTP.get(maps_url)

raw_response = response.to_s

parsed_response = JSON.parse(raw_response)

result = parsed_response.fetch("results")

geo = result.at(0).fetch("geometry")

loc = geo.fetch("location")

longitude = loc.fetch("lng")
latitude = loc.fetch("lat")

pp longitude
pp latitude

# pirate_weather_api_key = "3RrQrvLmiUayQ84JSxL8D2aXw99yRKlx1N4qFDUE"

# pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/41.8887,-87.6355"

# raw_response = HTTP.get(pirate_weather_url)

# parsed_response = JSON.parse(raw_response)

# currently_hash = parsed_response.fetch("currently")

# current_temp = currently_hash.fetch("temperature")

# puts current_temp

require 'net/http'
require	'net/https'
require 'openssl'
require 'uri'
require 'rubygems'
require 'json'

class DestinationParser 

	def distance_between_cities(one,two)
	origins = one
	destinations = two
	url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=#{origins}&destinations=#{destinations}&key=AIzaSyCY05U4IKsK-Wkb38WwyZOKPgOH6s8j_JI"
	uri = URI.parse(url)
	http = Net::HTTP.new(uri.host,uri.port)
	http.use_ssl = true
	request = Net::HTTP::Get.new(uri.request_uri)
	response = http.request(request)
	ssl = response.body

	parse = JSON.parse(ssl)

	parse2 =parse['destination_addresses'][0]
	town = parse2.to_s.split(',')
	
	destinations = town[0]

	parse2 = parse['origin_addresses'][0]
	town = parse2.to_s.split(',')

	origins = town[0]

	km = parse['rows'][0]['elements'][0]['distance']['text']
	
	time = parse['rows'][0]['elements'][0]['duration']['text']
	
	puts destinations + "-" + origins+", "+ km + ", " + time
	end
end

d = DestinationParser.new
d.distance_between_cities('London','Kiev')


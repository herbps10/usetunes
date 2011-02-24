require 'api.rb'
require 'net/http'

class SAB < API
	@@api = "eea9924af5b083eb2dd9fcb30cf5baac"
	@@server = "http://localhost:8081/"

	def self.send(url)
		url = @@server + "api?mode=addurl&cat=Music&apikey=" + @@api + "&name=" + url_encode(url)

		puts url

		Net::HTTP.get_response(URI.parse(url))
	end
end

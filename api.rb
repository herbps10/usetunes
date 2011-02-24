require 'cgi'

class API
	def self.url_encode(str)
		return CGI.escape(str)
	end
end

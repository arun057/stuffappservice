class Foursquare
	attr_accessor :client

	def initialize
		@client = Foursquare2::Client.new(:client_id => '0CWQ2DV4YRIH3YJMBJK0RO1GW35HMZ5NTGPQR0W5O0MD0VHB', :client_secret => '05HQLBGCVZLORAE2YGITVQ3D50DYJOMAFT4OTJUNAISKOKDQ')
	end

	def getVenues(lat, lon)
		self.client.search_venues(:ll => lat.to_s + ',' + lon.to_s)
	end

	def getTrending(lat, lon)
		self.client.trending_venues(lat.to_s + ',' + lon.to_s)
	end
end
class Meetup

	attr_accessor :client

	def initialize
		@client = RMeetup::Client
		@client.api_key = "3hb79kaf4tc1ktelk0039og7e6"
	end

	def find_open_events(lat, lng)
		RMeetup::Client.api_key = "3hb79kaf4tc1ktelk0039og7e6"
		# RMeetup::Client.fetch(:events,{:zip => "ZIP_CODE"})
		RMeetup::Client.fetch(:events,{:lat => lat, :lng => lng})
	end

end
class EventBrite
	include HTTParty
	base_uri 'https://www.eventbrite.com/json'

	attr_accessor :app_key

	def initialize
		@app_key = 'C7Z4N4TWHQ4RLMYRW4'
	end

	def event_search(lat,lng)
		JSON.parse(EventBrite.get('/event_search?app_key='+self.app_key+'&latitude='+lat+'&longitude='+lng).body)
	end
end
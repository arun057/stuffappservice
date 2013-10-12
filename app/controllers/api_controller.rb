class ApiController < ApplicationController

  def get
  	results = get_data(params[:lat],params[:lon])

  	respond_to do |format|
  		format.json  { render :json => results }
  	end

  end


  private

  def get_data(lat, lon)
  	fs = Foursquare.new
  	venues = fs.getTrending(lat,lon)

  	results = []

  	venues.venues.each do |venue|
  		v_category = venue.categories.first.parents[0] || '' unless venue.categories.nil?
  		v_icon = venue.categories.first.icon || '' unless venue.categories.nil?
  		result = {
  			name: venue.name,
  			lat: venue.location.lat,
  			lon: venue.location.lng,
  			icon: v_icon,
  			category: v_category,
  			type: 'foursquare',
  			description: ""
  		}
  		results.push(result)
  	end

  	# mt = Meetup.new
  	# events = mt.find_open_events(lat,lon)

  	# raise events

  	eb = EventBrite.new
  	response = eb.event_search(lat, lon)

  	response['events'][1].each do |event|
  		current_event = event[1]
  		result = {
  			name: current_event['title'],
  			lat: current_event['venue']['latitude'],
  			lon: current_event['venue']['longitude'],
  			icon: current_event['logo'],
  			category: current_event['category'].split(',')[0],
  			type: 'eventbrite',
  			description: current_event['description']
  		}
  		results.push(result)
  	end

  	results
  end

end

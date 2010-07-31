# Google Places

Ruby wrapper for the [Google Places API](http://code.google.com/apis/maps/documentation/places/).

## Warning

I think this works, but I'm not sure because I haven't been issued credentials yet. Use it at your own risk.

## Installation

As a plugin (in your Rails directory:

    script/plugin install git://github.com/phuphighter/google_places.git
    
## Get Google Places API credentials

They haven't fully launched the service but you can fill out an application form: [http://gmaps-ws-console.appspot.com/](http://gmaps-ws-console.appspot.com/)

Location Checkin apps have priority right now.  I know, this is stupid.  Hopefully they will make it easier.  I do not have credentials either.
    
## Usage

### Instantiate a client

    >> google_places = GooglePlaces::Client.new(:api_key => 'your_api_key', :client => 'client_id')
    
### or configure once

    >> GooglePlaces.configure do |config|
    >>   config.api_key = 'your_api_key'
    >>   config.client = 'client_id'
    >> end
    >> google_places = GooglePlaces::Client.new
    
#### Examples

    >> search_results = google_places.search(:location => '40.717859,-73.9577937', :radius => 1600, :sensor => true)
    >> search_results.results.first.name
    => "Williamsburg"
    
    >> place_detail = google_places.details(:reference => 'REFERENCE_ID', :sensor => true)
    >> place_detail.result.name
    >> "Peter Luger Steakhouse"
    
You can search for locations and get details for those locations. Pretty sweet if you can get the credentials!

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license

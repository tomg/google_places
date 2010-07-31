require 'helper'

class GooglePlacesTest < Test::Unit::TestCase

  context "When using the Google Places API" do
    setup do
      @client = GooglePlaces::Client.new(:api_key => 'google_places_key_that_they_gave_to_noone', :client_id => "wtf")
    end
    
    context "and searching for a place" do
      should "find a specific place within a certain radius" do
        stub_get("http://maps.google.com/maps/api/place/search/json?signature=8NGHyfHtAmWeg3CcESzPB5FPWkE%3D&location=40.717859%2C-73.9577937&client=wtf&radius=1600&sensor=true", "search.json")
        search_result = @client.search(:location => '40.717859,-73.9577937', :radius => 1600, :sensor => true)
        search_result.results.first.name.should == 'Williamsburg'
        search_result.results.first.types.first.should == "locality"
      end
    end  
    
    context "and requests the place details" do
      should "get details for a specific place" do
        stub_get("http://maps.google.com/maps/api/place/details/json?signature=cGsPtxClIcQNA29SGBT7UbdXR64%3D&client=wtf&reference=REFERENCE_ID&sensor=true", "details.json")
        place_detail = @client.details(:reference => 'REFERENCE_ID', :sensor => true)
        place_detail.result.name.should == "Peter Luger Steakhouse"
        place_detail.result.geometry.location.lat.should == 40.7099090
      end
    end
  end
  
end

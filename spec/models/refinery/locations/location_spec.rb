require 'spec_helper'

module Refinery
	module Locations

		describe Location, "geocode" do
			before :each do
			  @location = Location.make!(
			  	:address => '125 W 117th Street',
			  	:city => 'New York',
			  	:state_or_province => 'New York',
			  	:zip => '10026'
			  	)
			end

			describe "on success" do
				it "should find latitude and longitude given an address" do
				  @location.latitude.to_f.should be_within(0.00001).of(40.803403)
				  @location.longitude.to_f.should be_within(0.00001).of(-73.950273)
				end
			end
		end

		describe Location, "#full_street_address" do
			before :each do
			  @location = Location.make!(
			  	:address => '125 W 117th Street',
			  	:city => 'New York',
			  	:state_or_province => 'New York',
			  	:zip => '10026'
			  	)
			end
			describe "on success" do
			  it "should return the full street address as given" do
			    @location.full_street_address.should == "125 W 117th Street, New York, New York 10026"
			  end
			end
		end

		describe Location, "to_geojson_point" do
			before :each do
			  @location = Location.make!(
			  	:address => '125 W 117th Street',
			  	:city => 'New York',
			  	:state_or_province => 'New York',
			  	:zip => '10026'
			  	)
			end

			describe "on success" do
				it "should return a GEOJSON point version of a coordinate" do
					@location.to_geojson_point.should == "{ 'type': 'Point', 'coordinates': [#{@location.longitude}, #{@location.latitude}]}"
				end
			end

			describe "on failure" do
			  it "should return nil if self.latitude is blank" do
			  	@location.latitude = nil
			    @location.to_geojson_point.should be_nil
			  end

			  it "should return nil if self.longitude is blank" do
			  	@location.longitude = nil
			    @location.to_geojson_point.should be_nil
			  end

			end
		end
	end
end
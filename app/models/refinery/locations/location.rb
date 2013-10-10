require 'geocoder'
module Refinery
	module Locations
		class Location < ActiveRecord::Base
		  acts_as_indexed :fields => [:name, :address, :phone, :hours, :longitude, :latitude]
		  self.table_name = 'refinery_locations'
		  validates_presence_of :name, :region_id
		  validates_uniqueness_of :name
			attr_accessible :name, :address, :city, :state_or_province, :zip, :country, 
			 								:website, :phone, :hours, :longitude, :latitude, :online, :position,
			 								:women, :handbags, :shoes, :eyewear, :jewelry, :textile, :region_id

			geocoded_by :full_street_address
			after_validation :geocode 
			alias_attribute :title, :name

			scope :online, where(:online => true)
			scope :physical, where(:online => false)
			
			belongs_to :region, :class_name => '::Refinery::Locations::Region'
			
			# Aggregate attribute
			def full_street_address
				"#{self.address}, #{self.city}, #{self.state_or_province} #{self.zip}"
			end

			# Return a to_geojson_point version of the coordinates

			def to_geojson_point
				if self.longitude && self.latitude
					"{ 'type': 'Point', 'coordinates': [#{self.longitude}, #{self.latitude}]}"
				else 
					nil
				end
			end
		end
	end
end

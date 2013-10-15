require 'geocoder'
module Refinery
	module Locations
		class Location < ActiveRecord::Base
		  acts_as_indexed :fields => [:name, :address, :phone, :hours, :longitude, :latitude]
		  self.table_name = 'refinery_locations'
		  validates_presence_of   :name, :region_id
		  validates_uniqueness_of :name, :case_sensitive => false
		  validates_format_of     :name, :with => /^[^.*-.*]+$/, :message => "must not contain the character '-'"
		  validates :menu_id, :menu_extension => true
		  
		  before_save { |location| location.name = location.name.downcase }
		  
			attr_accessible :name, :address, :city, :state_or_province, :zip, :country, :fax, 
			                :phone, :email, :hours, :longitude, :latitude,  :position, :region_id, 
			                :image_id, :menu_id

			geocoded_by :full_street_address
			after_validation :geocode 
			alias_attribute :title, :name
			
			belongs_to :region, :class_name => '::Refinery::Locations::Region'
			belongs_to :image,  :class_name => '::Refinery::Image'
			belongs_to :menu,   :class_name => '::Refinery::Resource'
			
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
			
			def split_hours
				hours.split(/\s*\r*\n\s*/) if hours
			end
			
		end
	end
end

require 'machinist/active_record'
require 'faker'

Refinery::Locations::Region.blueprint do
	name { "#{Faker::Address.state}#{sn}" }
end

Refinery::Locations::Location.blueprint do 
	region { Refinery::Locations::Region.make! }
	name { "#{Faker::Address.city}#{sn}" }
	address { Faker::Address.street_address }
	city { Faker::Address.city }
	state_or_province { Faker::Address.state }
	zip { Faker::Address.zip }
	country { "USA" }
	email { Faker::Internet.email }
	phone { Faker::PhoneNumber.phone_number }
	fax   { Faker::PhoneNumber.phone_number }
end

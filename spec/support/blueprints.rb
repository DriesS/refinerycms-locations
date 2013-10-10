require 'machinist/active_record'
require 'faker'

Refinery::Locations::Region.blueprint do
	name { Faker::Address.city }
end

Refinery::Locations::Location.blueprint do 
	region { Refinery::Locations::Region.make! }
	name { Faker::Company.name }
	address { Faker::Address.street_address }
	city { Faker::Address.city }
	state_or_province { Faker::Address.state }
	zip { Faker::Address.zip }
	country { "USA" }
	website { Faker::Internet.url }
	phone { Faker::PhoneNumber.phone_number }
	online { false }
	women { false }
	handbags { true }
	shoes { true }
	eyewear { false }
	jewelry { true }
	textile { false }
end

require "spec_helper"

module Refinery
  module Locations
  	describe LocationsController do
      describe "GET #index" do
        before :each do
          Location.destroy_all
          @location_1, @location_2 = Location.make!(:name => "location 1"), Location.make!(:name => "location 2")
        end
        
        it "responds successfully with an HTTP 200 status code" do
          get :index
          expect(response).to be_success
          expect(response.status).to eq(200)
        end

        it "loads all of the locations into @locations" do
          get :index
          expect(assigns(:locations)).to match_array([@location_1, @location_2])
        end

        it "returns an array of full location objects in json format" do                
          get :index
          expect(response.body.size).to eq(Location.all.to_json.size)
        end
      end

      describe "GET #show" do
        before :each do
          @location = Location.make!(
            :address => '125 W 117th Street',
            :city => 'New York',
            :state_or_province => 'New York',
            :zip => '10026'
          )
        end

        it "responds successfully with an HTTP 200 status code" do
          get :show, :id => @location.id
          expect(response).to be_success
          expect(response.status).to eq(200)
        end

        it "renders the location object as a GEO JSON object" do
          get :show, :id => @location.id
          expect(response.body).to eq(@location.to_json)
        end
      end

      describe "GET #search" do
        describe "for a specific location" do
          before :each do
            @location = Location.make!(
              :address => '125 W 117th Street',
              :city => 'New York',
              :state_or_province => 'New York',
              :zip => '10026'
            )            
          end

          describe "on success" do
            it "should return all the stores in a given country" do
              get :search, :country => 'USA'
              expect(response.body).to eq(Location.near("USA").to_json)
            end

            it "should return all the stores in a given state" do
              get :search, :state => 'New York'
              expect(response.body).to eq(Location.near("New York").to_json)
            end

            it "should return all the stores in a given city" do
              get :search, :city => 'New York'
              expect(response.body).to eq(Location.near("New York").to_json)
            end

            it "should return all the stores in a given zip" do
              get :search, :zip => '10026'
              expect(response.body).to eq(Location.near("10026").to_json)
            end
          end

          describe "on failure" do
            it 'should return an empty json object' do
              get :search
              response.body.should =="[]"
            end
          end
        end
      end
    end
  end
end

require 'spec_helper'

module Refinery
  module Locations
    describe Region, "validations" do

      before :each do
        @region = Region.make
      end

      describe "on success" do
        it "should be valid" do
          @region.should be_valid
        end
      end

      describe "on failure" do
        it 'should not be valid without a name' do
          @region.name = nil
          @region.should_not be_valid
        end
      end
      
    end
  end
end

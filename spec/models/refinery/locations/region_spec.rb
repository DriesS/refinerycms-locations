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
        
		    it "should not accept character '-' on name attribute" do
		      region = Region.make(:name => "region-with-invalid-character")

		      region.valid?.should be_false
		      region.errors.full_messages.include?("Name must not contain the character '-'").should be_true
	      end
        
        it "name must be unique" do
	        region_1 = Region.make!
	        region_2 = Region.make(:name => region_1.name)

		      region_2.valid?.should be_false
          region_2.errors.full_messages.include?("Name has already been taken").should be_true
	      end	      
      end
      	  
    end
    
    describe Region, "before_save" do
      context 'name to downcase format' do
        it "should apply downcase method on name attribute" do
          region = Region.make!(:name => "Name Needs To Be Formated")

          region.name.should == "name needs to be formated"
        end
      end
    end
    
  end
end

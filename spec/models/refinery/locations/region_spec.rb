# require 'spec_helper'
# 
# module Refinery
#   module Locations
#     describe Import, "validations" do
#       before :each do
#         @import = Import.make!
#       end
# 
#       describe "on success" do
#         it "should be valid" do
#           @import.should be_valid
#         end
#       end
# 
#       describe "on failure" do
#         it 'should not be valid without a filename' do
#           @import.filename = nil
#           @import.should_not be_valid
#         end
#       end
#     end
# 
#     describe Import, "#process_filename" do
#       before :each do
#         extend ActionDispatch::TestProcess
#         @import = Import.make!
#         @fixture_file_pathname = "./spec/support/ejstore_locator_fixture.xls"
#         @import.attached_file = ::Refinery::Resource.create(:file => fixture_file_upload(@fixture_file_pathname))
#       end
# 
#       describe "while processing" do
#         before :each do
#           spreadsheet = Spreadsheet.open @fixture_file_pathname
#           @first_worksheet = spreadsheet.worksheet 0
#         end
# 
#         it 'should identify a row that had an address for a physical store' do
#           physical_store_row = @first_worksheet.row(5)
#           physical_store_row.should have_an_address
#         end
# 
#         it 'should identify a row that does not have an address for an online store' do
#           online_store_row = @first_worksheet.row(17)
#           online_store_row.should_not have_an_address
#         end
# 
#         describe "on success" do
#           before :each do
#             Location.destroy_all
#             @import.filename = @fixture_file_pathname
#           end
#           it "should create 10 physical locations" do
#             @import.process_filename
#             Location.physical.size.should be(10)
#           end
# 
#           it "should create 5 online locations" do
#             @import.process_filename
#             Location.online.size.should be(5)
#           end
# 
#         end
#       end
#     end
#   end
# end

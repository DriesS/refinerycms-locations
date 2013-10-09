# # encoding: utf-8
# require "spec_helper"
# 
# describe Refinery do
#   describe "Locations" do
#     describe "Admin" do
#       describe "imports" do
#         login_refinery_user
# 
#         describe "imports list" do
#           before do
#             FactoryGirl.create(:import, :filename => "UniqueTitleOne")
#             FactoryGirl.create(:import, :filename => "UniqueTitleTwo")
#           end
# 
#           it "shows two items" do
#             visit refinery.locations_admin_imports_path
#             page.should have_content("UniqueTitleOne")
#             page.should have_content("UniqueTitleTwo")
#           end
#         end
# 
#         describe "create" do
#           before do
#             visit refinery.locations_admin_imports_path
# 
#             click_link "Add New Import"
#           end
# 
#           context "valid data" do
#             it "should succeed" do
#               fill_in "Filename", :with => "This is a test of the first string field"
#               click_button "Save"
# 
#               page.should have_content("'This is a test of the first string field' was successfully added.")
#               Refinery::Locations::Import.count.should == 1
#             end
#           end
# 
#           context "invalid data" do
#             it "should fail" do
#               click_button "Save"
# 
#               page.should have_content("Filename can't be blank")
#               Refinery::Locations::Import.count.should == 0
#             end
#           end
# 
#           context "duplicate" do
#             before { FactoryGirl.create(:import, :filename => "UniqueTitle") }
# 
#             it "should fail" do
#               visit refinery.locations_admin_imports_path
# 
#               click_link "Add New Import"
# 
#               fill_in "Filename", :with => "UniqueTitle"
#               click_button "Save"
# 
#               page.should have_content("There were problems")
#               Refinery::Locations::Import.count.should == 1
#             end
#           end
# 
#         end
# 
#         describe "edit" do
#           before { FactoryGirl.create(:import, :filename => "A filename") }
# 
#           it "should succeed" do
#             visit refinery.locations_admin_imports_path
# 
#             within ".actions" do
#               click_link "Edit this import"
#             end
# 
#             fill_in "Filename", :with => "A different filename"
#             click_button "Save"
# 
#             page.should have_content("'A different filename' was successfully updated.")
#             page.should have_no_content("A filename")
#           end
#         end
# 
#         describe "destroy" do
#           before { FactoryGirl.create(:import, :filename => "UniqueTitleOne") }
# 
#           it "should succeed" do
#             visit refinery.locations_admin_imports_path
# 
#             click_link "Remove this import forever"
# 
#             page.should have_content("'UniqueTitleOne' was successfully removed.")
#             Refinery::Locations::Import.count.should == 0
#           end
#         end
# 
#       end
#     end
#   end
# end

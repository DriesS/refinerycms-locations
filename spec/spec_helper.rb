require 'rubygems'
require 'refinerycms-testing'
# Configure Rails Environment
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require 'rspec/rails'
require 'capybara/rspec'
require 'factory_girl_rails'
require 'spreadsheet'

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.mock_with :rspec
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
	config.include Devise::TestHelpers, :type => :controller
  config.extend  ::Refinery::Testing::ControllerMacros::Authentication, :type => :controller
  config.extend  ::Refinery::Testing::RequestMacros::Authentication, :type => :request
end

# set javascript driver for capybara
Capybara.javascript_driver = :selenium

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories including factories.
([Rails.root.to_s] | ::Refinery::Plugins.registered.pathnames).map{|p|
  Dir[File.join(p, 'spec', 'support', '**', '*.rb').to_s]
}.flatten.sort.each do |support_file|
  require support_file
end

# Requires supporting files with custom matchers and macros, etc,
# in ./spec/factories/
([Rails.root.to_s] | ::Refinery::Plugins.registered.pathnames).map{|p|
  Dir[File.join(p, 'spec', 'factories', '*.rb').to_s]
}.flatten.sort.each do |support_file|
  require support_file
end

# This is a temporary hack to get around some hackery with Devise when
# using the authentication macros in request specs that are defined in
# refinerycms-testing. If you remove this line ensure that tests pass
# in an extension that is testing against this Factory via the
# authentication macros in refinerycms-testing.
# 10-11-2011 - Jamie Winsor - jamie@enmasse.com
require Refinery.roots(:'refinery/authentication').join("app/models/refinery/role.rb")

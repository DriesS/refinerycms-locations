module Refinery
  module Locations
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Locations

      initializer "register refinery_locations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinery_locations"
          plugin.url = proc {  '/refinery/locations/locations' }
          plugin.menu_match = /refinery\/locations\/(locations|regions)/
          plugin.activity = { :class_name => :'refinery/locations/location' }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Locations)
      end
    end
  end
end

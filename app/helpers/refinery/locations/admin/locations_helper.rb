module Refinery
  module Locations
    module Admin
      module LocationsHelper
        
        def regions
          Refinery::Locations::Region.all
        end
        
      end
    end
  end
end
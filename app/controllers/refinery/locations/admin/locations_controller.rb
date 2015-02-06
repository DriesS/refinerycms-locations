module Refinery
  module Locations
    module Admin
      class LocationsController < ::Refinery::AdminController

        crudify :'refinery/locations/location',
                :title_attribute => 'title'

        private
          def location_params
            params.require(:location).permit!
          end

      end
    end
  end
end



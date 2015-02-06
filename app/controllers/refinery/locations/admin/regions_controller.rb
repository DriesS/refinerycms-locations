module Refinery
  module Locations
    module Admin
      class RegionsController < ::Refinery::AdminController
        crudify :'refinery/locations/region',
                :title_attribute => 'title'

      private
        def region_params
          params.require(:region).permit!
        end
      end
    end
  end
end



module Refinery
  module Locations
    module Admin
      module RegionsHelper
        
        def deletion_confirmation_massage(region)
          warning = t('deletion_warning', :scope => 'refinery.locations.admin.regions.messages')
          default_msg = t('message', :scope => 'refinery.admin.delete', :title => region.name)
          
          "\n#{warning}\n\n#{default_msg}\n"
        end
        
      end
    end
  end
end
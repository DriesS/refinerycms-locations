module Refinery
	module Locations
    class MenuExtensionValidator < ActiveModel::EachValidator
  
      def validate_each(record, attribute, value)
        return true unless value
        
        resource = Refinery::Resource.find(value)
        record.errors[attribute] << "must be a pdf document" unless resource.type_of_content =~ /pdf/
      end

    end
  end
end

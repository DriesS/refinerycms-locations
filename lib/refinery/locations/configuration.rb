module Refinery
  module Locations
    include ActiveSupport::Configurable

    config_accessor :page_url

    self.page_url = "/location"

    @@user_class_name = nil
    
    class << self
      def user_class=(class_name)
        if class_name.is_a?(Class)
          raise TypeError, "You can't set user_class to be a class, e.g., User.  Instead, please use a string like 'User'"
        elsif class_name.is_a?(String)
          @@user_class_name = class_name
        else
          raise TypeError, "Invalid type for user_class.  Please use a string like 'User'"
        end
      end

      def user_class
        class_name = @@user_class_name || 'Refinery::User'
        begin
          Object.const_get(class_name)
        rescue NameError
          class_name.constantize
        end
      end
    end
  end
end

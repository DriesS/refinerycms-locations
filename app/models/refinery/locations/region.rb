require 'spreadsheet'
module Refinery
  module Locations
    class Region < Refinery::Core::BaseModel
		  self.table_name = 'refinery_regions'

      has_many :locations, :class_name => '::Refinery::Locations::Location', :dependent => :destroy
      
      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates_presence_of   :name
      validates_uniqueness_of :name, :case_sensitive => false
      validates_format_of     :name, :with => /^[^.*-.*]+$/, :message => "must not contain the character '-'"
      
      alias_attribute :title, :name

      before_save { |region| region.name = region.name.downcase }
      
      after_commit :flush_cache

      def self.all_cached
        Rails.cache.fetch([name, 'all']) { Region.find(:all, :order => :position) }
      end

    protected

      def flush_cache
        Rails.cache.delete([self.class.name, 'all'])
      end

    end
  end
end

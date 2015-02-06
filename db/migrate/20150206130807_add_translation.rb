class AddTranslation < ActiveRecord::Migration
  def up
    ::Refinery::Locations::Location.reset_column_information
    unless defined?(::Refinery::Locations::Location::Translation) && ::Refinery::Locations::Location::Translation.table_exists?
      ::Refinery::Locations::Location.create_translation_table!({
        :name => :string,
        :address => :string,
        :city => :string,
        :hours => :string,
      }, {
        :migrate_data => true
      })
    end
  end

  def down
    ::Refinery::Locations::Location.reset_column_information

    ::Refinery::Locations::Location.drop_translation_table!
  end
end

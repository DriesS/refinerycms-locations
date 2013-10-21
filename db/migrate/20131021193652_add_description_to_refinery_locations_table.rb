class AddDescriptionToRefineryLocationsTable < ActiveRecord::Migration
  def change
    add_column :refinery_locations, :address_description, :string
  end
end

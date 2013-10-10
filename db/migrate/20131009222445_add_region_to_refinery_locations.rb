class AddRegionToRefineryLocations < ActiveRecord::Migration
  def change
    add_column :refinery_locations, :region_id, :integer
  end
end

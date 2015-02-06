class UpdateRefineryLocationsAttributes < ActiveRecord::Migration
  def up
    add_column    :refinery_locations, :email,    :string
    add_column    :refinery_locations, :image_id, :integer
  end

  def down
    remove_column :refinery_locations, :image_id
    remove_column :refinery_locations, :email
  end
end


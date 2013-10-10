class UpdateRefineryLocationsAttributes < ActiveRecord::Migration
  def up
    remove_column :refinery_locations, :online
    remove_column :refinery_locations, :women
    remove_column :refinery_locations, :handbags
    remove_column :refinery_locations, :shoes
    remove_column :refinery_locations, :eyewear
    remove_column :refinery_locations, :jewelry
    remove_column :refinery_locations, :textile
    remove_column :refinery_locations, :website

    add_column    :refinery_locations, :fax,      :string
    add_column    :refinery_locations, :email,    :string
    add_column    :refinery_locations, :menu_id,  :integer
    add_column    :refinery_locations, :image_id, :integer
  end

  def down
    remove_column :refinery_locations, :image_id
    remove_column :refinery_locations, :menu_id
    remove_column :refinery_locations, :email
    remove_column :refinery_locations, :fax
        
    add_column    :refinery_locations, :website,  :string
    add_column    :refinery_locations, :textile,  :boolean
    add_column    :refinery_locations, :jewelry,  :boolean
    add_column    :refinery_locations, :eyewear,  :boolean
    add_column    :refinery_locations, :shoes,    :boolean
    add_column    :refinery_locations, :handbags, :boolean
    add_column    :refinery_locations, :women,    :boolean
    add_column    :refinery_locations, :online,   :boolean
  end
end


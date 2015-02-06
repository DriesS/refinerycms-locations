class CreateRefineryLocations < ActiveRecord::Migration
  def up
    create_table :refinery_locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state_or_province
      t.string :zip
      t.string :country
      t.string :website
      t.string :phone
      t.string :hours
      t.string :longitude
      t.string :latitude
      t.integer :position
      t.timestamps
    end

  end

  def down
    Refinery::UserPlugin.destroy_all({:name => "Locations"})

    Refinery::Page.delete_all({:link_url => "/locations"})

    drop_table :refinery_locations
  end
end

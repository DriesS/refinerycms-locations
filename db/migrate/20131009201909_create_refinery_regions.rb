class CreateRefineryRegions < ActiveRecord::Migration
  def up
    create_table :refinery_regions do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :refinery_regions
  end
end
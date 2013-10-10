class DropRefineryImportsTable < ActiveRecord::Migration
  def up
    drop_table :refinery_imports
  end

  def down
    create_table :refinery_imports do |t|
      t.string  :filename
      t.string  :status
      t.integer :attached_file_id
      t.timestamps
    end
  end
end
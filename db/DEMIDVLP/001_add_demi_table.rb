class AddDemiTable < ActiveRecord::Migration
  def self.up
        create_table :st_student do |table|
          table.column :role_id, :varchar
          table.column :role_name, :varchar
          table.column :role_desc, :varchar
             
    
    end
  end

  def self.down
    drop_table :ST_STUDENT
  end
end

class AddDemiTable < ActiveRecord::Migration
  def self.up
        create_table :st_student do |table|
          table.column :student_number, :varchar2
          table.column :first_name, :varchar2
          table.column :middle_name, :varchar2
          table.column :last_name , :varchar2
          table.column :gender , :varchar2
          table.column :mobile_number, :varchar2
          table.column :email_addr, :varchar2
          table.column :icam_number, :varchar2      
    
    end
  end

  def self.down
    drop_table :ST_STUDENT
  end
end

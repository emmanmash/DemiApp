class AddDemiTable < ActiveRecord::Migration
  def self.up
    create_table :ST_STUDENT do |table|
      table.column :STUDENT_NUMBER, :VARCHAR2
      table.column :FIRST_NAME, :VARCHAR2
      table.column :MIDDLE_NAME, :VARCHAR2
      table.column :LAST_NAME , :VARCHAR2
      table.column :GENDER , :VARCHAR2
      table.column :MOBILE_NUMBER, :VARCHAR2
      table.column :EMAIL_ADDR, :VARCHAR2
      table.column :ICAM_NUMBER, :VARCHAR2      
                
    end
  end

  def self.down
    drop_table :ST_STUDENT
  end
end

class AddHstoreToCounselors < ActiveRecord::Migration
  
  def self.up
    
    add_column :counselors, :social_url, :hstore
  end

  def self.down
    
    remove_column :counselors, :social_url, :hstore
  end
  
  
end

class AddHstoreToCounselors < ActiveRecord::Migration
  
  def self.up
    execute 'CREATE EXTENSION hstore'
    add_column :counselors, :social_url, :hstore
  end

  def self.down
    execute 'DROP EXTENSION hstore'
    remove_column :counselors, :social_url, :hstore
  end
  
  
end

class AddHstoreToCounselors < ActiveRecord::Migration
  
  def self.up
    execute 'CREATE EXTENSION hstore'
  end

  def self.down
    execute 'DROP EXTENSION hstore'
  end
  
  def change
    add_column :counselors, :social_url, :hstore
  end
end

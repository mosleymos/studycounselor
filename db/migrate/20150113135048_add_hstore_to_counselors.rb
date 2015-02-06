class AddHstoreToCounselors < ActiveRecord::Migration
  def change
    add_column :counselors, :social_url, :hstore
  end
end

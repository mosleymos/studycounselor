class AddAvailabilityToCounselor < ActiveRecord::Migration
  def change
    add_column :counselors, :availability, :hstore
  end
end

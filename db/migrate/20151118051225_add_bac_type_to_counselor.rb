class AddBacTypeToCounselor < ActiveRecord::Migration
  def change
    add_column :counselors, :bac_type, :string
  end
end

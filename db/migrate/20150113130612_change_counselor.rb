class ChangeCounselor < ActiveRecord::Migration
  def change
    remove_column :counselors, :cursus
    remove_column :counselors, :general_comment
    rename_column :counselors, :adress, :address
  end
end

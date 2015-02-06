class AddFieldsToCounselor < ActiveRecord::Migration
  def change
    add_column :counselors, :general_description, :text
    add_column :counselors, :school_description, :text
    add_column :counselors, :jobs_description, :text
    add_column :counselors, :availibility_description, :text
    add_column :counselors, :image_url, :text
    add_column :counselors, :linkedin_url, :text
  end
end

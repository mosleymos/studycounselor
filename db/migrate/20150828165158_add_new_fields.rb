class AddNewFields < ActiveRecord::Migration
  def change
    add_column :counselors, :school_name, :string
    add_column :counselors, :moto, :string
    add_column :counselors, :study_domain, :string
    add_column :counselors, :high_school, :string
    add_column :counselors, :looking_job, :string
    add_column :counselors, :bac_mention, :string
    add_column :counselors, :study_level, :string
    add_column :counselors, :study_financing, :string
    
    add_column :schools, :student_number, :string
    add_column :schools, :photos_videos, :text
    add_column :schools, :fees, :text
    
    add_column :programs, :fees, :text
    
    
  end
end

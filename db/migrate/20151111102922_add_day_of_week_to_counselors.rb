class AddDayOfWeekToCounselors < ActiveRecord::Migration
  def change
	  add_column :counselors, :lundi, :string
	  add_column :counselors, :mardi, :string
	  add_column :counselors, :mercredi, :string
	  add_column :counselors, :jeudi, :string
	  add_column :counselors, :vendredi, :string
	  add_column :counselors, :samedi, :string
	  add_column :counselors, :dimanche, :string
#	  add_column :counselors, :mardi, :text, array: true, default: []
#	  add_column :counselors, :mercredi, :text, array: true, default: []
#	  add_column :counselors, :jeudi, :text, array: true, default: []
#	  add_column :counselors, :vendredi, :text, array: true, default: []
#	  add_column :counselors, :samedi, :text, array: true, default: []
#	  add_column :counselors, :dimanche, :text, array: true, default: []
  end
end

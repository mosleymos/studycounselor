class AddStudyGeoLocationToStudent < ActiveRecord::Migration
  def change
	 add_column :students, :study_geo_location, :text	
  end
end

class AddSchoolsToStudent < ActiveRecord::Migration
  def change
		add_column :students, :schools, :string
  end
end

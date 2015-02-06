class CreateStudyings < ActiveRecord::Migration
  def change
    create_table :studyings do |t|
      t.references :counselor, index: true
      t.references :school, index: true
      t.text :comment

      t.timestamps
    end
  end
end

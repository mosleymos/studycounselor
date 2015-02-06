class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.integer :age
      t.string :mail
      t.string :city
      t.string :etablissement
      t.text :previous_studies
      t.string :filieres
      t.integer :mean_grade
      t.string :father_profession
      t.string :mother_profession
      t.text :general_comment
      t.string :first_letter
      t.string :research_name

      t.timestamps
    end
  end
end

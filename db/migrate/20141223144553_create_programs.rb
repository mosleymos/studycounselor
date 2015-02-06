class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.text :program_url
      t.text :program_image_url
      t.references :school, index: true
      t.string :equivalent_year
      t.string :program_duration
      t.text :prerequisites
      t.string :first_letter
      t.string :research_name
      t.string :slug

      t.timestamps
    end
    add_index :programs, :name
  end
end

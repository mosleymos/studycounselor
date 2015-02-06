class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.text :name
      t.text :description
      t.string :image_url
      t.string :school_url
      t.string :first_letter
      t.text :research_name
      t.text :slug
      t.text :goals

      t.timestamps
    end
  end
end

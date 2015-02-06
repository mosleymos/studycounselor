class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.text :image_url
      t.string :first_letter
      t.string :research_name
      t.string :slug
      t.string :mean_salary

      t.timestamps
    end
    add_index :jobs, :name
  end
end

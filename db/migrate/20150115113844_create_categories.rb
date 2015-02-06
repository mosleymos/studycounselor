class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :research_name
      t.string :first_letter
      t.string :slug

      t.timestamps
    end
  end
end

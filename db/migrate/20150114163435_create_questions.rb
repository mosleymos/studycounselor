class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :name
      t.text :description
      t.text :research_name
      t.string :first_letter
      t.text :slug

      t.timestamps
    end
  end
end

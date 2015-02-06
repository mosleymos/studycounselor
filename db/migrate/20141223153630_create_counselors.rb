class CreateCounselors < ActiveRecord::Migration
  def change
    create_table :counselors do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :mail
      t.string :telephone
      t.string :slug
      t.text :adress
      t.text :cursus
      t.text :general_comment
      t.boolean :approved_by_administrator

      t.timestamps
    end
  end
end

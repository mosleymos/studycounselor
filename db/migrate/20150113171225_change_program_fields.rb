class ChangeProgramFields < ActiveRecord::Migration
  def change
    rename_column :programs, :program_image_url, :image_url
    add_column :programs, :diploma, :string
    add_column :programs, :campus, :string
    add_column :programs, :price, :integer
    rename_column :programs, :prerequisites, :admission_description
    add_column :programs, :perspectives_description, :text
    add_column :programs, :pedagogy_description, :text
  end
end

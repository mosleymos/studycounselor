class AddEmailAndEncryptedPasswordToSchool < ActiveRecord::Migration
  def change
		add_column :schools, :email, :string
		add_column :schools, :encrypted_password, :string
  end
end

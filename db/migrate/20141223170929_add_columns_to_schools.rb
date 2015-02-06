class AddColumnsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :address, :text
    add_column :schools, :moto, :text
    add_column :schools, :telephone, :string
    add_column :schools, :contact_mail, :string
    add_column :schools, :has_admin_account, :boolean
    add_column :schools, :statistics_text, :text
    
    add_column :schools, :twitter_url, :text
    add_column :schools, :facebook_url, :text
    add_column :schools, :youtube_url, :text
    add_column :schools, :linkedin_url, :text
  end
end

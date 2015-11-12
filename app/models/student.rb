# == Schema Information
#
# Table name: students
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  telephone            :string(255)
#  age                  :integer
#  mail                 :string(255)
#  city                 :string(255)
#  etablissement        :string(255)
#  previous_studies     :text
#  filieres             :string(255)
#  mean_grade           :integer
#  father_profession    :string(255)
#  mother_profession    :string(255)
#  general_comment      :text
#  first_letter         :string(255)
#  research_name        :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  study_geo_location   :text
#  student_info_channel :text
#  schools              :string(255)
#

class Student < ActiveRecord::Base
  
  has_many :cards
	validates :first_name, :presence => true 
	validates :age, :presence => true 
	validates :mail, :presence => true 
	validates :city, :presence => true 
	validates :etablissement, :presence => true 
	validates :filieres, :presence => true 
	validates :general_comment, :presence => true 
  
  
  def to_param
    "#{id}-#{full_name}".parameterize
  end
  
  def full_name
    return self.first_name.to_s +  " " + self.last_name.to_s
  end
end

# == Schema Information
#
# Table name: cards
#
#  id                   :integer          not null, primary key
#  appointment_datetime :datetime
#  comment_text         :text
#  avaibility_text      :text
#  student_id           :integer
#  counselor_id         :integer
#  created_at           :datetime
#  updated_at           :datetime
#  future_study_choice  :string(255)
#  careers_interest     :string(255)
#

class Card < ActiveRecord::Base
  belongs_to :student
  belongs_to :counselor
  attr_writer :programs_list
  
  has_many :leads
  has_many :programs, through: :leads
  
  def programs_list
   # tags.map(&:name).join(", ")
   @programs_list || self.programs.pluck(:name).join(",")
  end 
  
  def schools(student_id)
		list_of_schools  = Student.find(student_id).schools
		list_of_schools.gsub(/\,/, '   ').split(' ').to_a.uniq.map{ |elem| School.find(elem).name }
  end
  
end

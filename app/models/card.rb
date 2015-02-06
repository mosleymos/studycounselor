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
  
  def schools
    []
  end
  
end

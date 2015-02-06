# == Schema Information
#
# Table name: rankings
#
#  id           :integer          not null, primary key
#  student_id   :integer
#  counselor_id :integer
#  comment      :text
#  grade        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Ranking < ActiveRecord::Base
  belongs_to :student
  belongs_to :counselor
end

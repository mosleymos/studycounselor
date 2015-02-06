# == Schema Information
#
# Table name: studyings
#
#  id           :integer          not null, primary key
#  counselor_id :integer
#  school_id    :integer
#  comment      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Studying < ActiveRecord::Base
  belongs_to :counselor
  belongs_to :school
end

# == Schema Information
#
# Table name: questionings
#
#  id           :integer          not null, primary key
#  question_id  :integer
#  counselor_id :integer
#  priority     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Questioning < ActiveRecord::Base
  belongs_to :question
  belongs_to :counselor
end

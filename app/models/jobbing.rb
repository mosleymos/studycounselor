# == Schema Information
#
# Table name: jobbings
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  program_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Jobbing < ActiveRecord::Base
  belongs_to :job
  belongs_to :program
end

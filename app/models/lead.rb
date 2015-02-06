# == Schema Information
#
# Table name: leads
#
#  id                 :integer          not null, primary key
#  card_id            :integer
#  program_id         :integer
#  comment            :text
#  recall             :boolean
#  document           :boolean
#  approved_by_school :boolean
#  created_at         :datetime
#  updated_at         :datetime
#

class Lead < ActiveRecord::Base
  belongs_to :card
  belongs_to :program
  
  validates :card, :uniqueness => {:scope => [:program]}
end

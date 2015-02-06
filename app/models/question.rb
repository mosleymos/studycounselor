# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  name          :text
#  description   :text
#  research_name :text
#  first_letter  :string(255)
#  slug          :text
#  created_at    :datetime
#  updated_at    :datetime
#
class Question < ActiveRecord::Base
  include CommonMethods
  include Taggable

  extend FriendlyId
  friendly_id :name, use: :slugged

  after_create :update_research_name
  after_create :update_first_letter

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  has_many :questionings
  has_many :counselors, :through => :questionings

  attr_writer :counselors_list
  after_save :save_counselors_list
  
  # Handle the virtual attributes of the counselors linked to the question.
  def counselors_list
    @counselors_list || self.counselors.to_json
  end
  
  # Callback that save the counselors linked to the question.
  def save_counselors_list
    counselors = self.counselors_list.split(',')
    counselors_id = []

    counselors.each do |id|
      counselor = Counselor.find_by_id(id.to_i)
      if counselor
      counselors_id << counselor.id
      end
    end

    self.counselor_ids = counselors_id.uniq

  end
end

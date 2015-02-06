# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  image_url     :text
#  first_letter  :string(255)
#  research_name :string(255)
#  slug          :string(255)
#  mean_salary   :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Job < ActiveRecord::Base
  include CommonMethods
  include Taggable
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  mount_uploader :image_url, ImageUrlUploader
  
  after_create :update_research_name
  after_create :update_first_letter
  
  has_many :jobbings
  has_many :programs, through: :jobbings
  
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end

# == Schema Information
#
# Table name: tags
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  image_url     :text
#  first_letter  :string(255)
#  research_name :string(255)
#  slug          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Tag < ActiveRecord::Base
  include CommonMethods
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  mount_uploader :image_url, ImageUrlUploader
  
  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 2..30 } 
  
  before_save :sanitize_name
  
  after_create :update_research_name
  after_create :update_first_letter
  
  has_many :taggings
  has_many :programs, :through => :taggings, source: :taggable, source_type: "Program"
  
  
  # Basic sanitize
  def sanitize_name
    self.name = self.name.strip.downcase
  end 
  
end

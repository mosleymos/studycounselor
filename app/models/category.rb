# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  image_url     :string(255)
#  research_name :string(255)
#  first_letter  :string(255)
#  slug          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Category < ActiveRecord::Base
  include CommonMethods
  include Taggable

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image_url, ImageUrlUploader

  after_create :update_research_name
  after_create :update_first_letter

  has_many :categorizings
  has_many :schools, :through => :categorizings, source: :categorizable, source_type: "School"
  has_many :counselors, :through => :categorizings, source: :categorizable, source_type: "Counselor"

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end

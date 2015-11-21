# == Schema Information
#
# Table name: schools
#
#  id                :integer          not null, primary key
#  name              :text
#  description       :text
#  image_url         :string(255)
#  school_url        :string(255)
#  first_letter      :string(255)
#  research_name     :text
#  slug              :text
#  goals             :text
#  created_at        :datetime
#  updated_at        :datetime
#  address           :text
#  moto              :text
#  telephone         :string(255)
#  contact_mail      :string(255)
#  has_admin_account :boolean
#  statistics_text   :text
#  twitter_url       :text
#  facebook_url      :text
#  youtube_url       :text
#  linkedin_url      :text
#  student_number    :string(255)
#  photos_videos     :text
#  fees              :text
#  email             :string(255)
#  representative_id :integer
#

class School < ActiveRecord::Base
  include CommonMethods
  include Taggable
  include Categorizable
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  mount_uploader :image_url, ImageUrlUploader
  
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  
  after_create :update_research_name
  after_create :update_first_letter
  
  has_many :programs

  
  # To display the image.default if null or empty
  def avatar
    if self.image_url.to_s.empty?
      return "school.gif"
    else
      return self.image_url.to_s
    end
  end
  
end

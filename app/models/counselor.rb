# == Schema Information
#
# Table name: counselors
#
#  id                        :integer          not null, primary key
#  first_name                :string(255)
#  last_name                 :string(255)
#  birthdate                 :date
#  telephone                 :string(255)
#  slug                      :string(255)
#  address                   :text
#  approved_by_administrator :boolean
#  created_at                :datetime
#  updated_at                :datetime
#  general_description       :text
#  school_description        :text
#  jobs_description          :text
#  availibility_description  :text
#  image_url                 :text
#  linkedin_url              :text
#  email                     :string(255)      default(""), not null
#  encrypted_password        :string(255)      default(""), not null
#  reset_password_token      :string(255)
#  reset_password_sent_at    :datetime
#  remember_created_at       :datetime
#  sign_in_count             :integer          default(0), not null
#  current_sign_in_at        :datetime
#  last_sign_in_at           :datetime
#  current_sign_in_ip        :string(255)
#  last_sign_in_ip           :string(255)
#  confirmation_token        :string(255)
#  confirmed_at              :datetime
#  confirmation_sent_at      :datetime
#  unconfirmed_email         :string(255)
#  social_url                :hstore
#

class Counselor < ActiveRecord::Base
  include CommonMethods
  include Taggable
  include Categorizable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # For the image upload
  mount_uploader :image_url, ImageUrlUploader
  
  # For social interaction
  store_accessor :social_url, :facebook_url, :twitter_url, :linkedin_url, :google_plus_url
  
  
  has_many :appointments
  has_many :rankings
  has_many :cards
  has_many :studyings
  has_many :schools, through: :studyings
  
  has_many :questionings
  has_many :questions, :through => :questionings
  
  
  def full_name
    return self.first_name.to_s + " " + self.last_name.to_s
  end
 
  def pusher_channel_name
    return self.id.to_s + "-counselor"
  end
  
  def as_json(options)
    { :full_name => self.full_name, :id => self.id}
  end
  
  # For the name in the URL. Too many conflict with all the same name
  def to_param
    "#{id}-#{full_name}".parameterize
  end
  
  
  
  
end

# == Schema Information
#
# Table name: programs
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  description              :text
#  program_url              :text
#  image_url                :text
#  school_id                :integer
#  equivalent_year          :string(255)
#  program_duration         :string(255)
#  admission_description    :text
#  first_letter             :string(255)
#  research_name            :string(255)
#  slug                     :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  diploma                  :string(255)
#  campus                   :string(255)
#  price                    :integer
#  perspectives_description :text
#  pedagogy_description     :text
#  fees                     :text
#

class Program < ActiveRecord::Base
  include CommonMethods
  include Taggable
  
  mount_uploader :image_url, ImageUrlUploader

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :school_id, presence: true

  after_create :update_research_name
  after_create :update_first_letter

  attr_writer :jobs_list

  belongs_to :school
  has_many :leads
  has_many :cards, through: :leads

  has_many :jobbings
  has_many :jobs, :through => :jobbings

  after_save :save_jobs_list
  # For the name in the URL. Too many conflict with all the same name
  def to_param
    "#{id}-#{name}".parameterize
  end

  def jobs_list
    @jobs_list || self.jobs.pluck(:name).join(',')
  end

  def save_jobs_list
    jobs = self.jobs_list.split(',')
    jobs_id = []

    jobs.each do |id|
      job = Job.find_by_id(id.to_i)
      if job
      jobs_id << job.id
      end
    end

    self.job_ids = jobs_id.uniq

  end

end
